return {
	{
		"pmizio/typescript-tools.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cond = require("utils.have").enabled_typescript_tools(),
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
		config = function()
			require("plugins.config.typescript-tools")
		end,
	},

	-- lspsaga
	{
		"nvimdev/lspsaga.nvim",
		enabled = false,
		event = "LspAttach",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
		init = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()

			keys[#keys + 1] = {
				"<C-j>",
				"<Cmd>Lspsaga diagnostic_jump_next<CR>",
				desc = "Jump Next Error",
			}

			keys[#keys + 1] = {
				"gd",
				"<Cmd>Lspsaga finder<CR>",
				desc = "Finer",
			}

			keys[#keys + 1] = {
				"gp",
				"<Cmd>Lspsaga peek_definition<CR>",
				desc = "Peek definition",
			}
		end,
		config = function()
			require("lspsaga").setup({
				ui = {
					code_action = "💡",
				},
				lightbulb = {
					sign = false,
					virtual_text = true,
					enable = false,
				},
				symbols_in_winbar = { enable = true },
				implement = {
					enable = true,
					sign = false,
					virtual_text = true,
				},
			})
		end,
	},

	-- glance
	{
		"dnlhc/glance.nvim",
		init = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()

			keys[#keys + 1] = {
				"gd",
				"<cmd>Glance definitions<CR>",
				desc = "LSP Definition",
			}

			keys[#keys + 1] = {
				"gr",
				"<cmd>Glance references<CR>",
				desc = "LSP References",
			}

			keys[#keys + 1] = {
				"gI",
				"<cmd>Glance implementations<CR>",
				desc = "LSP Implementations",
			}

			keys[#keys + 1] = {
				"gy",
				"<cmd>Glance type_definitions<CR>",
				desc = "LSP Type Definitions",
			}
		end,
		config = function()
			require("plugins.config.glance")
		end,
		cmd = { "Glance" },
	},

	-- tools
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"stylua",
				"selene",
				"luacheck",
				"shellcheck",
				"shfmt",
				"tailwindcss-language-server",
				"css-lsp",
			})
		end,
	},

	-- lsp servers
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
			---@type lspconfig.options
			servers = {
				cssls = {},
				tailwindcss = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
				},
				volar = {
					capabilities = require("utils.volar").capabilities,
					filetypes = require("utils.volar").filetypes,
					root_dir = require("utils.volar").root_dir,
					init_options = require("utils.volar").init_options,
					on_new_config = require("utils.volar").on_new_config,
					settings = require("utils.volar").settings,
					on_attach = require("utils.volar").on_attach,
				},
				html = {},
				yamlls = {
					settings = {
						yaml = {
							keyOrdering = false,
						},
					},
				},
				lua_ls = {
					-- enabled = false,
					single_file_support = true,
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								workspaceWord = true,
								callSnippet = "Both",
							},
							misc = {
								parameters = {
									-- "--log-level=trace",
								},
							},
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
							doc = {
								privateName = { "^_" },
							},
							type = {
								castNumberToInteger = true,
							},
							diagnostics = {
								disable = { "incomplete-signature-doc", "trailing-space" },
								-- enable = false,
								groupSeverity = {
									strong = "Warning",
									strict = "Warning",
								},
								groupFileStatus = {
									["ambiguity"] = "Opened",
									["await"] = "Opened",
									["codestyle"] = "None",
									["duplicate"] = "Opened",
									["global"] = "Opened",
									["luadoc"] = "Opened",
									["redefined"] = "Opened",
									["strict"] = "Opened",
									["strong"] = "Opened",
									["type-check"] = "Opened",
									["unbalanced"] = "Opened",
									["unused"] = "Opened",
								},
								unusedLocalExclude = { "_*" },
							},
							format = {
								enable = false,
								defaultConfig = {
									indent_style = "space",
									indent_size = "2",
									continuation_indent_size = "2",
								},
							},
						},
					},
				},
			},
			setup = {},
		},
	},
}
