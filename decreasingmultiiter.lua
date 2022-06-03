-- same but only iterate over increasing tuples
--[=[ i'm too dumb to get the ranges correct,...
local function decreasingMultiIter(start, finish)
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
local multiIter = require 'multiiter'
local function decreasingMultiIter(start, finish)
	return coroutine.wrap(function()
		for i in multiIter(start, finish) do
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

return decreasingMultiIter
