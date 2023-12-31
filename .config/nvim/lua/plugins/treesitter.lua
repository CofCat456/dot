return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"tsx",
				"typescript",
				"javascript",
				"html",
				"css",
				"scss",
				"vue",
				"gitignore",
				"json",
				"lua",
				"markdown",
				"sql",
				"jsdoc",
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)

			-- MDX
			vim.filetype.add({
				extension = {
					mdx = "mdx",
				},
			})
			vim.treesitter.language.register("markdown", "mdx")
		end,
	},
}
