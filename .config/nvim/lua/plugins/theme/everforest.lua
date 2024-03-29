local everforest_status_ok, everforest = pcall(require, "everforest")
if not everforest_status_ok then
	return
end

everforest.setup({
	background = "hard",
	transparent_background_level = 0,
	italics = false,
	disable_italic_comments = true,
})

everforest.load()
