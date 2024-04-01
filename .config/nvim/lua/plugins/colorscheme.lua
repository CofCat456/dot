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
}
