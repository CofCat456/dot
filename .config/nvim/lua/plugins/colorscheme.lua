return {
	--  tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		enabled = CofCat.colorscheme == "tokyonight",
		config = function()
			require("plugins.theme.tokyonight")
		end,
		priority = 1000,
	},

	-- Everforest
	{
		"sainnhe/everforest",
		lazy = false,
		enabled = CofCat.colorscheme == "everforest",
		config = function()
			vim.api.nvim_create_autocmd({ "ColorScheme" }, {
				pattern = { "everforest" },
				callback = function(_ev)
					vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#9ccfd8" })
					vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#9ccfd8" })
				end,
			})
			vim.g.everforest_current_word = "underline"
			vim.g.everforest_background = "soft"
			vim.g.everforest_better_performance = 1
			vim.g.everforest_transparent_background = CofCat.ui.transparent and 1 or 0
		end,
		priority = 1000,
	},

	-- Oxocarbon
	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false,
		enabled = CofCat.colorscheme == "oxocarbon",
		config = function() end,
		priority = 1000,
	},
}
