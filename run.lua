#!/usr/bin/env luajit
--[[
look at all combinations of N many multiplications

lets start with N=2 for now

then search through all max degree of a tensor
--]]
local class = require 'ext.class'
local table = require 'ext.table'
local range = require 'ext.range'
local math = require 'ext.math'
local symmath = require 'symmath'
local tolua = require 'ext.tolua'
local var = symmath.var
local Tensor = symmath.Tensor
local tableToMul = symmath.tableToMul

local cmdline = require 'ext.cmdline'(...)

--symmath.tostring = symmath.export.SingleLine

local allmaxdegree = tonumber(cmdline.maxdegree) or 3
local maxnumvars = tonumber(cmdline.numvars) or 4

-- do i have that somewhere?
local function multiter(start, finish)
	local numvars = #start
	assert(numvars == #finish)
	return coroutine.wrap(function()
		local vardegs = {}
		for i=1,#start do
			vardegs[i] = start[i]
		end
		local done
		while true do
			coroutine.yield(vardegs)
			for i=1,numvars do
				vardegs[i] = vardegs[i] + 1
				if vardegs[i] <= finish[i] then
					break
				else
					vardegs[i] = start[i]
					if i == numvars then
						done = true
						break
					end
				end
			end
			if done then break end
		end
	end)
end

-- same but only iterate over increasing tuples
--[=[ i'm too dumb to get the ranges correct,...
local function deciter(start, finish)
	local numvars = #start
	assert(numvars == #finish)
	return coroutine.wrap(function()
		local vardegs = {}
		for i=1,#start do
			vardegs[i] = start[i]
		end
		local done
		while true do
			coroutine.yield(vardegs)
			for i=1,numvars do
				vardegs[i] = vardegs[i] + 1
				if vardegs[i] <= finish[i] then
					break
				else
					if i == numvars then
						done = true
						break
					end
					vardegs[i] = start[i]
					--[[
					for j=i-1,1,-1 do
						vardegs[j] = math.max(vardegs[j], vardegs[i])
					end
					vardegs[i+1] = vardegs[i+1]-1	-- undo the next inc
					--]]
				end
			end
			if done then break end
		end
	end)
end
--]=]
-- [=[ ... so i'm just going to discard invalid iterations ... should go a bit slower than it could
local function deciter(start, finish)
	return coroutine.wrap(function()
		for i in multiter(start, finish) do
			local fail
			for j=1,#i-1 do
				if i[j] < i[j+1] then fail = true break end
			end
			if not fail then
				coroutine.yield(i)
			end
		end
	end)
end
--]=]

local variableLetters = range(('AZ'):byte(1,2)):mapi(function(ch) return string.char(ch) end)

--[[
aexpr = structure so far
aindexes = options to set the symbol of bref[1+bi] to 
bref = Tensor.Ref of var'b' to bind
bi = index of bref that we are binding
--]]
local function bind(terms, termMax, bref, bi, results, vardegs)
	local aexpr = tableToMul(terms)
	if #terms >= termMax then
		results:insert{expr=aexpr, degree=#aexpr:getIndexesUsed()}
		return
	end

	if bi > vardegs[#terms+1] then return end
	
	bref = bref or Tensor.Ref(var(variableLetters[#terms+1]))

	local fixed, summed, extra = (aexpr * bref):getIndexesUsed()
	local symbols = fixed

	local alreadyUsedSymbolKeys = {}
	for _,t in ipairs{fixed, summed, extra} do
		for _,index in ipairs(t) do 
			alreadyUsedSymbolKeys[index.symbol] = true 
		end
	end
	for i=2,bi do
		alreadyUsedSymbolKeys[bref[i].symbol] = true
	end
	local newsymbol = select(2, Tensor.defaultSymbols:find(nil, function(sym)
		return not alreadyUsedSymbolKeys[sym]
	end))
	symbols = symbols:filter(function(index)
		return not table.find(table.sub(bref,2), nil, function(bi)
			return bi.symbol == index.symbol
		end)
	end)
	
	symbols:insert(Tensor.Index{symbol=newsymbol})
	for _,srci in ipairs(symbols) do
		bref = bref:clone()
		bref[1+bi] = Tensor.Index{
			lower = false,
			symbol = srci.symbol,
		}
		if bi < vardegs[#terms+1] then
			-- if we still have more to recurse and handle the next index
			bind(table(terms), termMax, bref, bi+1, results, vardegs)
		elseif bi == vardegs[#terms+1] then
			
			-- if we just filled the last index then now we can produce a new var (if necessary)
			-- TODO INSTEAD here, instead of making a new term here, instead redo this for all possible symmetries and antisymmetries
			bind(table(terms):append{bref}, termMax, nil, 1, results, vardegs)
		end
	end
end

local OutputAllExprs = class()
function OutputAllExprs:output(vardegs, results, numResultsPerDegree)
	-- #vardegs == maxdegree
	io.write('for degrees: '..tolua(vardegs))
	results:sort(function(a,b) return a.degree < b.degree end)
	print()
	for _,result in ipairs(results) do
		print('expr: '..result.expr, 'degree: '..result.degree)
	end
	print()
end

local OutputCounts = class()
function OutputCounts:output(vardegs, results, numResultsPerDegree)
	-- #vardegs == maxdegree
	io.write('for degrees: '..tolua(vardegs))
	io.write(' counts per result degree:')
	--[=[
	print(' '..tolua(numResultsPerDegree))
	--]=]
	-- [=[
	for _,k in ipairs(table.keys(numResultsPerDegree):sort()) do
		local v = numResultsPerDegree[k]
		if cmdline.factors then
			v = v == 1 and '1' or math.primeFactorization(v):concat','
		end
		io.write(' '..k..'->'..v)
	end
	print()
end

local OutputCountsMarkdown = class()
function OutputCountsMarkdown:init()
	-- can you do overflow in markdown tables?
	-- if not then just print these here
	self.t = table()
	local row = table()
	self.t:insert(row)	-- pad it with empty columsn in the end
end
function OutputCountsMarkdown:output(vardegs, results, numResultsPerDegree)
	local row = table()
	self.t:insert(row)
	for i=1,maxnumvars do
		row[i] = tostring(vardegs[i] or '')
	end
	row:insert''
	
	for k=0,(table.keys(numResultsPerDegree):sup()) do
		local v = numResultsPerDegree[k]
		if v and cmdline.factors then
			v = v == 1 and '1' or math.primeFactorization(v):concat','
		end
		v = v or ''
		row:insert(tostring(v or ''))
	end
end
function OutputCountsMarkdown:done()
	print'input degrees vs counts per degree'
	print()		-- markdown needs a free line before the table to format it?
	-- pad all rows to the max row
	local numcols = self.t:mapi(function(row) return #row end):sup()
	for i,row in ipairs(self.t) do
		while #row < numcols do row:insert'' end
	end
	
	-- now that we know the max degree, change the first row to have proper headerss
	local firstrow = self.t[1]
	for i=maxnumvars+2,#firstrow do
		firstrow[i] = ''..(i-maxnumvars-2)
	end

	-- now for each column, count the num chars
	local colsizes = table()
	for j=1,numcols do
		local colsize = self.t:mapi(function(row) return #row[j] end):sup()
		for i,row in ipairs(self.t) do
			row[j] = row[j]..(' '):rep(colsize - #row[j] + 1)
		end
	end
	-- now print
	for i,row in ipairs(self.t) do
		local line = '|'..row:concat'|'..'|'
		print(line)
		if i == 1 then
			print((line:gsub('[^|]', '-')))
		end
	end
end

local output = ({
	exprs = OutputAllExprs,				-- print all expressions
	count = OutputCounts,				-- just print the counts
	markdown = OutputCountsMarkdown,	-- print counts in a markdown table
})[cmdline.output or 'count']()

for numvars=2,maxnumvars do
	--print('num vars = '..numvars)
	for maxdegree=1,allmaxdegree do
		--print('max degree = '..maxdegree)
		local startdeg = range(numvars-1):mapi(function(i) return 1 end)
		local enddeg = range(numvars-1):mapi(function(i) return maxdegree end)
		-- TODO make sure all unique permutations are iterated over
		--for vardegs in multiter(startdeg, enddeg) do
		for vardegs in deciter(startdeg, enddeg) do
			vardegs = table(vardegs)
			vardegs:insert(1, maxdegree)
			
			local terms = table()
			local results = table()
			bind(terms, numvars, nil, 1, results, vardegs)
			local numResultsPerDegree = {}
			for _,result in ipairs(results) do
				numResultsPerDegree[result.degree] = (numResultsPerDegree[result.degree] or 0) + 1
			end
			
			output:output(vardegs, results, numResultsPerDegree)
		end
	end
end
if output.done then output:done() end
