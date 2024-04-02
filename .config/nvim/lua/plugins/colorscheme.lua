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

	-- Vitesse
	{
		"2nthony/vitesse.nvim",
		dependencies = {
			"tjdevries/colorbuddy.nvim",
		},
		opts = {
			transparent_background = CofCat.ui.transparent,
			transparent_float_background = CofCat.ui.transparent,
			dim_nc = true,
			cmp_cmdline_disable_search_highlight_group = true,
			diagnostic_virtual_text_background = true,
		},
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
				end,
			})
			vim.g.everforest_background = "soft"
			vim.g.everforest_better_performance = 1
			vim.g.everforest_transparent_background = CofCat.ui.transparent and 1 or 0
		end,
		priority = 1000,
	},
}
