return {
	{
		"pmizio/typescript-tools.nvim",
		enabled = CofCat.plugins.typescriptTools,
		event = { "BufReadPre", "BufNewFile" },
		cond = require("utils.have").enabled_typescript_tools(),
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
		config = function()
			require("plugins.config.typescript-tools")
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
			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})

			vim.list_extend(opts.ensure_installed, {
				"stylua",
				"selene",
				"luacheck",
				"shellcheck",
				"shfmt",
				"tailwindcss-language-server",
				"typescript-language-server",
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
					-- capabilities = require("utils.volar").capabilities,
					filetypes = require("utils.lsp.volar").filetypes,
					root_dir = require("utils.lsp.volar").root_dir,
					-- init_options = require("utils.volar").init_options,
					on_new_config = require("utils.lsp.volar").on_new_config,
					settings = require("utils.lsp.volar").settings,
					on_attach = require("utils.lsp.volar").on_attach,
				},
				html = {},
				emmet_ls = {
					filetypes = {
						"html",
					},
				},
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
