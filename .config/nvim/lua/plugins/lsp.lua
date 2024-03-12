return {
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
		config = true,
		cmd = { "Glance" },
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
					root_dir = function(fname)
						local root_pattern = require("lspconfig").util.root_pattern(
							"tailwind.config.cjs",
							"tailwind.config.js",
							"postcss.config.js"
						)
						return root_pattern(fname)
					end,
				},
				-- volar = {
				-- 	root_dir = function(...)
				-- 		return require("lspconfig.util").root_pattern(".git")(...)
				-- 	end,
				-- 	settings = {
				-- 		vue = {
				-- 			complete = {
				-- 				casing = {
				-- 					props = "autoKebab",
				-- 					tags = "autoPascal",
				-- 				},
				-- 			},
				-- 		},
				-- 	},
				-- },
				tsserver = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
					single_file_support = false,
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
						"vue",
					},
					init_options = {
						hostInfo = "neovim",
						plugins = {
							{
								name = "@vue/typescript-plugin",
								location = require("utils.getPath").get_npm_global_path() .. "/@vue/typescript-plugin",
								-- location = "~/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server",
								languages = {
									"vue",
								},
							},
						},
					},
					settings = {
						typescript = {
							inlayHints = {
								importModuleSpecifierPreference = "non-relative",
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
				html = {},
				emmet_ls = {
					filetypes = {
						"html",
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
			setup = {
				eslint = function()
					require("lazyvim.util").lsp.on_attach(function(client)
						if client.name == "eslint" then
							client.server_capabilities.documentFormattingProvider = true
						elseif client.name == "tsserver" then
							client.server_capabilities.documentFormattingProvider = false
						elseif client.name == "volar" then
							client.server_capabilities.documentFormattingProvider = false
						end
					end)
				end,
			},
		},
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				["javascript"] = { { "prettierd", "prettier" } },
				["typescript"] = { { "prettierd", "prettier" } },
				["javascriptreact"] = { { "prettierd", "prettier" } },
				["typescriptreact"] = { { "prettierd", "prettier" } },
				["vue"] = { { "prettierd", "prettier" } },
			},
			formatters = {
				-- Dealing with old version of prettierd that doesn't support range formatting
				prettier = {
					cwd = require("conform.util").root_file({
						".prettier.config.js",
						".prettierrc.json",
					}),
					require_cwd = true,
				},
			},
		},
	},
}
