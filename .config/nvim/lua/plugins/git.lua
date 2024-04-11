return {
	-- git conflict
	{
		"akinsho/git-conflict.nvim",
		lazy = false,
		config = function()
			require("plugins.git.conflict")
		end,
		keys = {
			{ "<Leader>gCb", "<cmd>GitConflictChooseBoth<CR>", desc = "choose both" },
			{ "<Leader>gCn", "<cmd>GitConflictNextConflict<CR>", desc = "move to next conflict" },
			{ "<Leader>gCc", "<cmd>GitConflictChooseOurs<CR>", desc = "choose current" },
			{ "<Leader>gCp", "<cmd>GitConflictPrevConflict<CR>", desc = "move to prev conflict" },
			{ "<Leader>gCi", "<cmd>GitConflictChooseTheirs<CR>", desc = "choose incoming" },
		},
	},

	-- better diffing
	{
		"sindrets/diffview.nvim",
		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
		},
		opts = {},
		keys = {
			{
				"<leader>gd",
				"<cmd>DiffviewOpen<cr>",
				desc = "DiffView",
			},
		},
	},
}
