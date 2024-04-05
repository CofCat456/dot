------------------------------------------------
--                                            --
--    This is a main configuration file for   --
--                    CofCat                  --
--      Change variables which you need to    --
--                                            --
------------------------------------------------

local theme = {
	tokyonight = "tokyonight",
	everforest = "everforest",
	oxocarbon = "oxocarbon",
}

CofCat = {
	--- @usage 'tokyonight' | 'everforest' | 'oxocarbon'
	colorscheme = theme.oxocarbon,
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
