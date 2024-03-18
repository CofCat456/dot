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
	kanagawa = "kanagawa",
}

CofCat = {
	--- @usage 'tokyonight' | 'catppuccin' | 'kanagawa'
	colorscheme = theme.kanagawa,
	ui = {
		transparent = false,
		float = {
			border = "rounded",
		},
	},
	plugins = {
		flash = true,
		typescriptTools = false,
	},
	lsp = {
		virtual_text = true, -- show virtual text (errors, warnings, info) inline messages
	},
}
