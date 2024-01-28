return {
	-- better diffing
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		opts = {},
		keys = {
			{
				"<leader>gd",
				"<cmd>DiffviewOpen<cr>",
				desc = "DiffView",
			},
		},
	},

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

	{
		"LudoPinelli/comment-box.nvim",
		lazy = false,
		keys = {
			{ "<leader>ac", "<cmd>lua require('comment-box').lcbox()<CR>", desc = "comment box" },
			{ "<leader>ac", "<cmd>lua require('comment-box').lcbox()<CR>", mode = "v", desc = "comment box" },
		},
	},

	-- Create beautiful code snippets
	{
		"TobinPalmer/rayso.nvim",
		cmd = "Rayso",
		config = function()
			require("rayso").setup({
				open_cmd = "Arc",
			})
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

	-- mini.hipatterns
	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		opts = {
			highlighters = {
				hsl_color = {
					pattern = "hsl%(%d+,? %d+,? %d+%)",
					group = function(_, match)
						local utils = require("solarized-osaka.hsl")
						--- @type string, string, string
						local nh, ns, nl = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
						--- @type number?, number?, number?
						local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
						--- @type string
						local hex_color = utils.hslToHex(h, s, l)
						return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
					end,
				},
			},
		},
	},

	-- hex 2 rgba
	{
		"austinwilcox/hex2rgba",
		keys = {
			{
				"<leader>cs",
				function()
					require("hex2rgba").hex2rgba()
				end,
				desc = "Hex2rgba",
			},
		},
	},

	-- package info
	{
		"vuki656/package-info.nvim",
		event = "BufEnter package.json",
		opts = {
			colors = {
				up_to_date = "#3C4048", -- Text color for up to date package virtual text
				outdated = "#fc514e", -- Text color for outdated package virtual text
			},
			icons = {
				enable = true, -- Whether to display icons
				style = {
					up_to_date = "|  ", -- Icon for up to date dependencies
					outdated = "|  ", -- Icon for outdated dependencies
				},
			},
			autostart = true, -- Whether to autostart when `package.json` is opened
			hide_up_to_date = true, -- It hides up to date versions when displaying virtual text
			hide_unstable_versions = true, -- It hides unstable versions from version list e.g next-11.1.3-canary3

			-- Can be `npm` or `yarn`. Used for `delete`, `install` etc...
			-- The plugin will try to auto-detect the package manager based on
			-- `yarn.lock` or `package-lock.json`. If none are found it will use the
			-- provided one,                              if nothing is provided it will use `yarn`
			package_manager = "pnpm",
		},
		keys = {
			{
				"<leader>ns",
				function()
					require("package-info").show()
				end,
				desc = "Show dependency versions",
			},
			{
				"<leader>nc",
				function()
					require("package-info").hide()
				end,
				desc = "Hide dependency versions",
			},
			{
				"<leader>nt",
				function()
					require("package-info").toggle()
				end,
				desc = "Toggle dependency versions",
			},
			{
				"<leader>nu",
				function()
					require("package-info").update()
				end,
				desc = "Update dependency on the line",
			},
			{
				"<leader>nd",
				function()
					require("package-info").delete()
				end,
				desc = "Delete dependency on the line",
			},
			{
				"<leader>ni",
				function()
					require("package-info").install()
				end,
				desc = "Install a new dependency",
			},
			{
				"<leader>np",
				function()
					require("package-info").change_version()
				end,
				desc = "Install a different dependency version",
			},
		},
	},
}
