local catppuccin_status_ok, catppuccin = pcall(require, "catppuccin")
if not catppuccin_status_ok then
	return
end

-- ╭──────────────────────────────────────────────────────────╮
-- │                        catppuccin                        │
-- ╰──────────────────────────────────────────────────────────╯

catppuccin.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	transparent_background = false,
	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "light",
		percentage = 0.9, -- percentage of the shade to apply to the inactive window
	},
	no_italic = true,
	custom_highlights = function(colors)
		local searchActive = { bg = colors.red, fg = "#181825" }
		local searchInactive = { bg = colors.peach, fg = "#000000" }

		return {
			CursorLineNr = { fg = colors.flamingo },
			Search = searchInactive,
			IncSearch = searchActive,
			EndOfBuffer = { fg = colors.flamingo },
			WinSeparator = { fg = colors.surface0, bg = colors.surface0 },
		}
	end,
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
