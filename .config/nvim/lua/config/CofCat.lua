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
	colorscheme = theme.everforest,
	ui = {
		transparent = false,
		float = {
			border = "rounded",
		},
	},
	plugins = {
		tree = false,
		blankline = false,
		indentscope = false,
		flash = true,
		switch = false,
		treesitter = {
			context = false,
		},
	},
	lsp = {
		virtual_text = true, -- show virtual text (errors, warnings, info) inline messages
	},
}
