local baseDefinitionHandler = vim.lsp.handlers["textDocument/definition"]

local filter = require("utils.lsp.filter").filter
local filterReactDTS = require("utils.lsp.filterReactDTS").filterReactDTS

local mason_registry = require("mason-registry")
local tsserver_path = mason_registry.get_package("typescript-language-server"):get_install_path()

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		silent = true,
		border = CofCat.ui.float.border,
	}),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = CofCat.ui.float.border }),
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ virtual_text = CofCat.lsp.virtual_text }
	),
	["textDocument/definition"] = function(err, result, method, ...)
		P(result)
		if vim.tbl_islist(result) and #result > 1 then
			local filtered_result = filter(result, filterReactDTS)
			return baseDefinitionHandler(err, filtered_result, method, ...)
		end

		baseDefinitionHandler(err, result, method, ...)
	end,
}

require("typescript-tools").setup({
	on_attach = function(client, bufnr)
		-- NOTE: close format
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		if vim.fn.has("nvim-0.10") then
			-- Enable inlay hints
			vim.lsp.inlay_hint.enable(bufnr, true)
		end
	end,
	handlers = handlers,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
	},
	settings = {
		separate_diagnostic_server = true,
		composite_mode = "separate_diagnostic",
		publish_diagnostic_on = "insert_leave",
		tsserver_file_preferences = {
			importModuleSpecifierPreference = "non-relative",
			includeInlayParameterNameHints = "all",
			includeCompletionsForModuleExports = true,
			quotePreference = "auto",
		},
		tsserver_plugins = {
			"@vue/typescript-plugin",
		},
	},
})
