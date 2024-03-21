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

	-- Everforest
	{
		"neanias/everforest-nvim",
		lazy = false,
		enabled = CofCat.colorscheme == "everforest",
		config = function()
			require("plugins.theme.everforest")
		end,
		priority = 1000,
	},
}
