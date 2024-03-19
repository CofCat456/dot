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
			commentStyle = { italic = false },
			functionStyle = { italic = false },
			keywordStyle = { italic = false },
			typeStyle = { italic = false },
			statementStyle = { italic = false, bold = true },
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
			overrides = function()
				return {
					["@variable.builtin"] = { italic = false },
				}
			end,
		},
		priority = 1000,
	},
}
