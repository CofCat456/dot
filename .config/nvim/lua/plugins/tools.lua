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

	-- nvim-ufo
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		opts = {
			provider_selector = function(_, _, _)
				return { "treesitter", "indent" }
			end,
		},
		keys = {
			{ "zR", "<cmd>lua require('ufo').openAllFolds()<cr>", desc = "Open folds" },
			{ "zM", "<cmd>lua require('ufo').closeAllFolds()<cr>", desc = "Close folds" },
		},
	},

	-- wtf
	{
		"piersolenski/wtf.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = true,
		keys = {
			-- {
			-- 	"gw",
			-- 	mode = { "n", "x" },
			-- 	function()
			-- 		require("wtf").ai()
			-- 	end,
			-- 	desc = "Debug diagnostic with AI",
			-- },
			{
				mode = { "n" },
				"gW",
				function()
					require("wtf").search()
				end,
				desc = "Search diagnostic with Google",
			},
		},
	},
}
