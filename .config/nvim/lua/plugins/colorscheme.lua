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

	-- Catppuccin
	{
		"catppuccin/nvim",
		lazy = false,
		enabled = CofCat.colorscheme == "catppuccin",
		config = function()
			require("plugins.theme.catppuccin")
		end,
		priority = 1000,
	},

	-- Kanagawa
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		enabled = CofCat.colorscheme == "kanagawa",
		build = ":KanagawaCompile",
		opts = {
			compile = true,
			dimInactive = true,
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
			theme = "dragon",
			background = {
				dark = "dragon",
				light = "lotus",
			},
		},
		priority = 1000,
	},
}
