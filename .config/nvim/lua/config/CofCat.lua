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
	solarized_osaka = "solarized-osaka",
}

CofCat = {
	--- @usage 'tokyonight' | 'catppuccin' | 'solarized-osaka'
	colorscheme = theme.tokyonight,
	ui = {
		transparent = true,
		float = {
			border = "rounded",
		},
	},
	lsp = {
		virtual_text = true, -- show virtual text (errors, warnings, info) inline messages
	},
}
