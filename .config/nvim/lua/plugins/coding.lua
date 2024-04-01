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
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				build = "make install_jsregexp",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load({
						paths = { vim.fn.stdpath("config") .. "/snippets" },
					})
				end,
			},
			{
				"hrsh7th/cmp-emoji",
			},
		},
		opts = function(_, opts)
			table.insert(opts.sources, { name = "emoji" })
		end,
	},

	{
		"smoka7/multicursors.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"smoka7/hydra.nvim",
		},
		opts = {
			hint_config = {
				border = CofCat.ui.float.border or "rounded",
				position = "bottom",
				show_name = false,
			},
		},
		keys = {
			{
				"<LEADER>m",
				"<CMD>MCstart<CR>",
				desc = "multicursor",
			},
			{
				"<LEADER>m",
				"<CMD>MCvisual<CR>",
				mode = "v",
				desc = "multicursor",
			},
			{
				"<C-Down>",
				"<CMD>MCunderCursor<CR>",
				desc = "multicursor down",
			},
		},
	},

	{
		"simrat39/symbols-outline.nvim",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		cmd = "SymbolsOutline",
		opts = {
			position = "right",
		},
	},
}
