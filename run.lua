#!/usr/bin/env luajit
--[[
look at all combinations of N many multiplications

lets start with N=2 for now

then search through all max degree of a tensor
--]]
local table = require 'ext.table'
local range = require 'ext.range'
local symmath = require 'symmath'
local var = symmath.var
local Tensor = symmath.Tensor
local tableToMul = symmath.tableToMul

--symmath.tostring = symmath.export.SingleLine

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
			for i=2,numvars do
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

-- this is reset before each bind() recursive call
local variableLetters

--[[
aexpr = structure so far
aindexes = options to set the symbol of bref[1+bi] to 
bref = Tensor.Ref of var'b' to bind
bi = index of bref that we are binding
bmax = max of bi ... stop once it is past this
--]]
local function bind(terms, termMax, bref, bi, bmax, results, vardegs)
	if bi > bmax then return end
	
	bref = bref or Tensor.Ref(var(variableLetters:remove(1)))
	local aexpr = tableToMul(terms)

--print('expr: ' .. (aexpr * bref))
	local fixed, summed, extra = (aexpr * bref):getIndexesUsed()
	local symbols = fixed
--print('fixed '..table.mapi(fixed, tostring):concat())
--print('summed'..table.mapi(summed, tostring):concat())
--print('extra '..table.mapi(extra, tostring):concat())

	-- add an unused symbol to the end of 'symbols' *HERE*
	local alreadyUsedSymbolKeys = {}
	for _,t in ipairs{fixed, summed, extra} do
		for _,index in ipairs(t) do 
			alreadyUsedSymbolKeys[index.symbol] = true 
		end
	end
--print('bi', bi)	
	for i=2,bi do
--print('removing old b symbol '..bref[i].symbol)		
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
--print('old expr symbols: '..table.mapi(symbols, tostring):concat()
--	..' old bref symbols: '..table.sub(bref, 2):mapi(tostring):concat()
--	..' new symbol '..newsymbol)	
	
	symbols:insert(Tensor.Index{symbol=newsymbol})
	
--print("cycling thru "..table.mapi(symbols, tostring):concat' ')
	for _,srci in ipairs(symbols) do
--print('prev: '..require 'ext.tolua'(bref[bi].symbol or nil))
--print('adding '..srci.symbol)
		bref = bref:clone()
		bref[1+bi] = Tensor.Index{
			lower = false,
			symbol = srci.symbol,
		}

		local prod = (aexpr * bref)

		if bi == bmax then
			-- TODO here instead of printing ... 
			-- instead increment the "currentNumVars"
			-- store aexpr * bref => aexpr
			-- and process it again for a new bref

			local nextterms = table(terms)
			nextterms:insert(bref)
			if #nextterms >= termMax then 
				results:insert{expr=prod, degree=#prod:getIndexesUsed()}
				return 
			end
			
			bind(nextterms, termMax, nil, 1, vardegs[#nextterms+1], results, vardegs)

		elseif bi < bmax then
			bind(table(terms), termMax, bref, bi+1, bmax, results, vardegs)
		end
	end
end

for numvars=2,3 do
	print('num vars = '..numvars)
	for maxdegree=1,2 do
		print('max degree = '..maxdegree)
		local startdeg = range(numvars):mapi(function(i) return i==1 and maxdegree or 1 end)
		local enddeg = range(numvars):mapi(function(i) return maxdegree end)
		for vardegs in multiter(startdeg, enddeg) do
			print('degree for each var: '..require'ext.tolua'(vardegs))
			print()

			variableLetters = range(('AZ'):byte(1,2)):mapi(function(ch) return string.char(ch) end)
			
			-- expr = 1
			-- fixed = expr:getIndexesUsed() = {}
			-- then cycle through all possible index places of a
			-- then for each index place, assign to one of the set of {all fixed symbols of expr, union a new symbol}
			
			-- ok now for each index of 'b', cycle thru all 'a's indexes (or a new index)
			
			local terms = table()
			--[[
			local aexpr = var(variableLetters:remove(1))( range(vardegs[1]):mapi(function(i) return ' _'..Tensor.defaultSymbols[i] end):concat() )
			terms:insert(aexpr)
			--]]
			local results = table()
			bind(terms, numvars, nil, 1, vardegs[#terms+1], results, vardegs)
			results:sort(function(a,b) return a.degree < b.degree end)
			for _,result in ipairs(results) do
				print('expr: '..result.expr, 'degree: '..result.degree)
		
			end
			print()
		end
	end
end
