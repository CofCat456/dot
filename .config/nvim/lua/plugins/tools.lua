return {
	-- peek lines just when you intend
	{
		"nacro90/numb.nvim",
		lazy = false,
		config = true,
	},

	{
		"axelvc/template-string.nvim",
		event = "InsertEnter",
		config = true,
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = function(_, opt)
			opt.current_line_blame = true
			opt.current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 200,
				ignore_whitespace = false,
				relative_time = true,
			}
			opt.current_line_blame_formatter_opts = {
				relative_time = true,
			}

			-- opt.current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>"
			opt.sign_priority = 0
		end,
	},

	-- switch boolean
	{
		"AndrewRadev/switch.vim",
		vscode = true,
		keys = {
			{
				"<leader>sx",
				function()
					vim.cmd("Switch")
				end,
				desc = "Switch",
			},
		},

		config = function()
			vim.g.switch_mapping = ""
		end,
	},

	-- fash move
	{
		"folke/flash.nvim",
		enabled = CofCat.plugins.flash,
		event = "VeryLazy",
		opts = {
			char = {
				keys = { "f", "F", "t", "T" },
			},
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
			},
		},
	},

	{
		"dmmulroy/tsc.nvim",
		cmd = { "TSC" },
		config = true,
	},
}
