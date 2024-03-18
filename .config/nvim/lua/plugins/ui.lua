return {
	-- messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})
			local focused = true
			vim.api.nvim_create_autocmd("FocusGained", {
				callback = function()
					focused = true
				end,
			})
			vim.api.nvim_create_autocmd("FocusLost", {
				callback = function()
					focused = false
				end,
			})
			table.insert(opts.routes, 1, {
				filter = {
					cond = function()
						return not focused
					end,
				},
				view = "notify_send",
				opts = { stop = false },
			})

			opts.commands = {
				all = {
					-- options for the message history that you get with `:Noice`
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(event)
					vim.schedule(function()
						require("noice.text.markdown").keys(event.buf)
					end)
				end,
			})

			opts.presets.lsp_doc_border = true
		end,
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
		},
	},

	-- buffer line
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		opts = {
			options = {
				mode = "tabs",
				-- separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
	},

	-- floating winbar
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function(_)
			local icons = require("lazyvim.config").icons

			return {
				options = {
					theme = "auto",
					globalstatus = true,
					disabled_filetypes = {
						statusline = {
							"dashboard",
							"lazy",
							"alpha",
							"grapple",
						},
					},
					component_separators = "",
					section_separators = "",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "grapple" },
					lualine_c = {},
					lualine_x = {
						{
							function()
								return require("noice").api.status.mode.get()
							end,
							cond = function()
								return package.loaded["noice"] and require("noice").api.status.mode.has()
							end,
						},
						{
							"diff",
							symbols = {
								added = icons.git.added,
								modified = icons.git.modified,
								removed = icons.git.removed,
							},
						},
						{
							"branch",
							fmt = function(str)
								return string.sub(str, 1, 12)
							end,
						},
					},
					lualine_y = {
						{ "filetype", icon = false },
						"location",
					},
					lualine_z = {
						{ "filename", file_status = true },
					},
				},
			}
		end,
	},

	{
		"b0o/incline.nvim",
		event = "VeryLazy",
		config = true,
	},

	-- dashboard
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = function(_, opts)
			local logo = [[
        ██████╗ ██████╗ ███████╗ ██████╗ █████╗ ████████╗
        ██╔════╝██╔═══██╗██╔════╝██╔════╝██╔══██╗╚══██╔══╝
        ██║     ██║   ██║█████╗  ██║     ███████║   ██║   
        ██║     ██║   ██║██╔══╝  ██║     ██╔══██║   ██║   
        ╚██████╗╚██████╔╝██║     ╚██████╗██║  ██║   ██║   
        ╚═════╝ ╚═════╝ ╚═╝      ╚═════╝╚═╝  ╚═╝   ╚═╝   
      ]]
			logo = string.rep("\n", 8) .. logo .. "\n\n"
			opts.config.header = vim.split(logo, "\n")
		end,
	},
}
