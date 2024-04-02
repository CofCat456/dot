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
		end,
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 1000,
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
		"b0o/incline.nvim",
		event = "BufReadPre",
		config = function()
			local tokyonight_status_ok, tokyonight = pcall(require, "tokyonight.colors")
			local incline = require("incline")

			if not tokyonight_status_ok then
				incline.setup()
				return
			end

			local colors = tokyonight.setup()
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = "#FC56B1", guifg = colors.black },
						InclineNormalNC = { guifg = "#FC56B1", guibg = colors.black },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},

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
  

        ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         
          ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       
                ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     
                ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    
                ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   
        ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  
        ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   
      ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  
      ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ 
            ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     
            ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     
      ]]
			logo = string.rep("\n", 8) .. logo .. "\n\n"
			opts.config.header = vim.split(logo, "\n")
		end,
	},

	-- ╭──────────────────────────────────────────────────────────╮
	-- │ Setup UI Border                                          │
	-- ╰──────────────────────────────────────────────────────────╯
	--
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			local cmp = require("cmp")
			opts.window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			}
		end,
	},
	{
		"mason.nvim",
		opts = {
			ui = {
				border = CofCat.ui.float,
			},
		},
	},
	{
		"folke/noice.nvim",
		opts = {
			presets = {
				lsp_doc_border = true,
			},
		},
	},
	{
		"stevearc/dressing.nvim",
		opts = {
			input = {
				border = CofCat.ui.float,
			},
			select = {
				nui = {
					border = CofCat.ui.float,
				},
				builtin = {
					border = CofCat.ui.float,
				},
			},
		},
	},
	{
		"gitsigns.nvim",
		opts = {
			preview_config = {
				border = CofCat.ui.float,
			},
		},
	},
}
