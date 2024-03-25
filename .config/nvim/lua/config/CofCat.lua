------------------------------------------------
--                                            --
--    This is a main configuration file for   --
--                    CofCat                  --
--      Change variables which you need to    --
--                                            --
------------------------------------------------

local theme = {
	tokyonight = "tokyonight",
	catppuccin = "catppuccin",
	everforest = "everforest",
}

CofCat = {
	--- @usage 'tokyonight' | 'catppuccin' | 'evetforest'
	colorscheme = theme.tokyonight,
	ui = {
		transparent = false,
		float = {
			border = "rounded",
		},
	},
	plugins = {
		flash = true,
		typescriptTools = true,
	},
	lsp = {
		virtual_text = true, -- show virtual text (errors, warnings, info) inline messages
	},
}
