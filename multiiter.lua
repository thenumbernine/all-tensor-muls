-- do i have that somewhere?
local function multiIter(start, finish)
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

return multiIter
