local typescript_tools_status_ok, typescript_tools = pcall(require, "typescript-tools")
if not typescript_tools_status_ok then
	return
end

typescript_tools.setup({
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
		single_file_support = false,
		separate_diagnostic_server = true,
		composite_mode = "separate_diagnostic",
		publish_diagnostic_on = "insert_leave",
		tsserver_locale = "zh-tw",
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
	on_attach = function(client)
		-- NOTE: close volar format
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		client.server_capabilities.semanticTokensProvider = false
	end,
})
