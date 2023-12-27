local filter = require("utils.lsp.filter").filter
local filterReactDTS = require("utils.lsp.filterReactDTS").filterReactDTS

require("glance").setup({
	hooks = {
		before_open = function(results, open, jump, method)
			if #results == 1 then
				jump(results[1]) -- argument is optional
			elseif method == "definitions" then
				results = filter(results, filterReactDTS)
				open(results)
			else
				open(results)
			end
		end,
	},
})
