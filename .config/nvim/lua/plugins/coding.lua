return {
	-- Create annotations with one keybind, and jump your cursor in the inserted annotation
	{
		"danymat/neogen",
		opts = {
			snippet_engine = "luasnip",
		},
		keys = {
			{
				"<leader>cc",
				function()
					require("neogen").generate({})
				end,
				desc = "Neogen Comment",
			},
		},
	},

	-- Refactoring tool
	{
		"ThePrimeagen/refactoring.nvim",
		keys = {
			{
				"<leader>r",
				function()
					require("refactoring").select_refactor()
				end,
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
		},
		opts = {},
	},

	{
		"Wansmer/treesj",
		keys = {
			{
				"J",
				"<cmd>TSJToggle<cr>",
				desc = "Join Toggle",
			},
		},
		opts = {
			use_default_keymaps = false,
			max_join_length = 150,
		},
	},

	{
		"L3MON4D3/LuaSnip",
		event = "LazyFile",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = { vim.fn.stdpath("config") .. "/snippets" },
			})
		end,
	},

	{
		"cshuaimin/ssr.nvim",
		keys = {
			{
				"<leader>sR",
				function()
					require("ssr").open()
				end,
				mode = { "n", "x" },
				desc = "Structural Replace",
			},
		},
	},
}
