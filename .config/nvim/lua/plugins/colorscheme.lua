return {
	-- solarized-osaka
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		enabled = CofCat.colorscheme == "solarized-osaka",
		opts = function()
			return {
				transparent = true,
			}
		end,
		priority = 1000,
	},

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
}
