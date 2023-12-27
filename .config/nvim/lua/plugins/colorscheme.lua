return {
	-- solarized-osaka
	{
		"craftzdog/solarized-osaka.nvim",
		enabled = CofCat.colorscheme == "solarized-osaka",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
			}
		end,
	},

	--  tokyonight
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		enabled = CofCat.colorscheme == "moon",
		event = "VeryLazy",
		config = function()
			require("plugins.theme.tokyonight")
		end,
	},

	-- Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = CofCat.colorscheme == "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("plugins.theme.catppuccin")
		end,
	},
}
