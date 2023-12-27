local catppuccin_status_ok, catppuccin = pcall(require, "catppuccin")
if not catppuccin_status_ok then
	return
end

-- ╭──────────────────────────────────────────────────────────╮
-- │                        catppuccin                        │
-- ╰──────────────────────────────────────────────────────────╯

catppuccin.setup({
	flavour = "macchiato", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "macchiato",
	},
	transparent_background = CofCat.ui.transparent, -- disables setting the background color.
	show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
	term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = true, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	no_underline = false, -- Force no underline
	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integration_default = nil, -- set to true/false to enable/disable integrations by default
	integrations = {
		cmp = true,
		gitsigns = true,
		treesitter = true,
		lsp_saga = true,
		markdown = true,
		mason = true,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")

-- ╭──────────────────────────────────────────────────────────╮
-- │                         lualine                          │
-- ╰──────────────────────────────────────────────────────────╯

local lualine_status_ok, lualine = pcall(require, "lualine")

if not lualine_status_ok then
	return
end

local macchiato = require("catppuccin.palettes").get_palette("macchiato")
local catppuccin_options = require("catppuccin").options
local transparent_bg = catppuccin_options.transparent_background and "NONE" or macchiato.mantle

local custom_catppuccin_theme = {
	normal = {
		a = { bg = macchiato.lavender, fg = macchiato.mantle, gui = "bold" },
		b = { bg = macchiato.mauve, fg = macchiato.mantle },
		c = { bg = transparent_bg, fg = macchiato.text },
		y = { bg = macchiato.red, fg = macchiato.mantle, gui = "bold" },
		z = { bg = macchiato.pink, fg = macchiato.mantle },
	},

	insert = {
		a = { bg = macchiato.green, fg = macchiato.base, gui = "bold" },
		b = { bg = macchiato.surface1, fg = macchiato.teal },
	},

	terminal = {
		a = { bg = macchiato.green, fg = macchiato.base, gui = "bold" },
		b = { bg = macchiato.surface1, fg = macchiato.teal },
	},

	command = {
		a = { bg = macchiato.peach, fg = macchiato.base, gui = "bold" },
		b = { bg = macchiato.surface1, fg = macchiato.peach },
	},

	visual = {
		a = { bg = macchiato.mauve, fg = macchiato.base, gui = "bold" },
		b = { bg = macchiato.surface1, fg = macchiato.mauve },
	},

	replace = {
		a = { bg = macchiato.red, fg = macchiato.base, gui = "bold" },
		b = { bg = macchiato.surface1, fg = macchiato.red },
	},

	inactive = {
		a = { bg = transparent_bg, fg = macchiato.blue },
		b = { bg = transparent_bg, fg = macchiato.surface1, gui = "bold" },
		c = { bg = transparent_bg, fg = macchiato.overlay0 },
	},
}

lualine.setup({
	options = {
		theme = custom_catppuccin_theme,
	},
})
