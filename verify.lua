#!/usr/bin/env luajit
-- veriyfing that my values are correct
local table = require 'ext.table'
local range = require 'ext.range'
local tolua = require 'ext.tolua'
local math = require 'ext.math'
local decreasingMultiIter = require 'decreasingmultiiter'
local cmdline = require 'ext.cmdline'(...)

local allmaxdegree = tonumber(cmdline.maxdegree) or 3
local maxnumvars = 2	-- I only have 2 var formula so far

-- TODO is the argument order correct?
-- also TODO optimize
local function ncr(a,b)
	return math.factorial(a) 
		/ (math.factorial(b) * math.factorial(a - b))
end

for numvars=2,maxnumvars do
	for maxdegree=1,allmaxdegree do
		local startdeg = range(numvars-1):mapi(function(i) return 1 end)
		local enddeg = range(numvars-1):mapi(function(i) return maxdegree end)
		for vardegs in decreasingMultiIter(startdeg, enddeg) do
			vardegs = table(vardegs)
			vardegs:insert(1, maxdegree)
			io.write('for degrees: '..tolua(vardegs))
			
			local i1, i2 = table.unpack(vardegs)
			local maxOutputDegree = i1 + i2
			local numResultsPerDegree = {}
			for j=0,maxOutputDegree do
				if j % 2 == 1 then	-- odd
					local m = (j - 1) / 2
					numResultsPerDegree[j] =
						range(0,m):mapi(function(k)
							local sum = 0
							if i1 == i2 + 2 * k + 1 then
								sum = sum + ncr(i2, m - k) * math.factorial(i1) / math.factorial(m+k+1)
							end
							if i2 == i1 + 2 * k + 1 then
								sum = sum + ncr(i1, m - k) * math.factorial(i2) / math.factorial(m+k+1)
							end
							return sum
						end):sum()			
				else	-- even
					local m = j / 2
					numResultsPerDegree[j] =
						range(0,m):mapi(function(k)
							local sum = 0
							if i1 == i2 + 2 * k then
								sum = sum + ncr(i2, m - k) * math.factorial(i1) / math.factorial(m+k)
							end
							return sum
						end):sum()
						+ (range(1,m):mapi(function(k)
							local sum = 0
							if i2 == i1 + 2 * k then
								sum = sum + ncr(i1, m - k) * math.factorial(i2) / math.factorial(m+k)
							end
							return sum
						end):sum() or 0)
				end
				if numResultsPerDegree[j] == 0 then
					numResultsPerDegree[j] = nil
				end
			end
			io.write(' counts per result degree: ')
			for _,k in ipairs(table.keys(numResultsPerDegree):sort()) do
				local v = numResultsPerDegree[k]
				io.write(' '..k..'->'..v)
			end
			print()
		end
	end
end
