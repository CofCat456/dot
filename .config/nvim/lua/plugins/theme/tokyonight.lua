local tokyonight_status_ok, tokyonight = pcall(require, "tokyonight")
if not tokyonight_status_ok then
	return
end

tokyonight.setup({
	style = "moon",
	transparent = CofCat.ui.transparent,
	-- styles = {
	--   sidebars = "transparent",
	--   floats = "transparent",
	-- },
	sidebars = {
		"qf",
		"vista_kind",
		"terminal",
		"spectre_panel",
		"startuptime",
		"Outline",
	},
	on_colors = function(c)
		-- local hsluv = require("tokyonight.hsluv")
		-- local function randomColor(color)
		--   if color ~= "NONE" then
		--     local hsl = hsluv.hex_to_hsluv(color)
		--     hsl[1] = math.random(0, 360)
		--     return hsluv.hsluv_to_hex(hsl)
		--   end
		--   return color
		-- end
		-- local function set(colors)
		--   if type(colors) == "table" then
		--     for k, v in pairs(colors) do
		--       if type(v) == "string" then
		--         colors[k] = randomColor(v)
		--       elseif type(v) == "table" then
		--         set(v)
		--       end
		--     end
		--   end
		-- end
		-- set(c)
	end,
	on_highlights = function(hl, c)
		hl.CursorLineNr = { fg = "#00c9ff", bold = true }
		hl.LineNrAbove = { fg = c.fg_gutter }
		hl.LineNrBelow = { fg = c.fg_gutter }
		local prompt = "#2d3149"
		hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
		hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
		hl.TelescopePromptNormal = { bg = prompt }
		hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
		hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = "#00c9ff" }
		hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
		hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
	end,
})
