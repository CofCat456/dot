------------------------------------------------
--                                            --
--    This is a main configuration file for   --
--                    CofCat                  --
--      Change variables which you need to    --
--                                            --
------------------------------------------------

local theme = {
	tokyonight = "tokyonight",
	vitesse = "vitesse",
	everforest = "everforest",
}

CofCat = {
	--- @usage 'tokyonight' | 'vitesse' | 'everforest'
	colorscheme = theme.everforest,
	ui = {
		transparent = false,
		float = {
			border = "rounded",
		},
	},
	plugins = {
		flash = true,
	},
	lsp = {
		virtual_text = true, -- show virtual text (errors, warnings, info) inline messages
	},
}
