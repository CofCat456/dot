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
		lazy = false,
		enabled = CofCat.colorscheme == "vitesse",
		dependencies = {
			"tjdevries/colorbuddy.nvim",
		},
		opts = {
			transparent_background = false,
			reverse_visual = true,
			dim_nc = true,
			cmp_cmdline_disable_search_highlight_group = true,
			diagnostic_virtual_text_background = true,
		},
		priority = 1000,
	},
}
