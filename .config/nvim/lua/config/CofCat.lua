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
}

CofCat = {
	--- @usage 'tokyonight' | 'vitesse'
	colorscheme = theme.vitesse,
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
