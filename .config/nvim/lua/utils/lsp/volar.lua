local util = require("lspconfig.util")

local M = {}

local have_vue = require("utils.have").have_vue()

--  ╭──────────────────────────────────────────────────────────╮
--  │                         Settings                         │
--  ╰──────────────────────────────────────────────────────────╯

local function get_typescript_server_path(root_dir)
	-- Alternative location if installed as root:
	-- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
	local found_ts = ""
	local global_ts = "/Users/cofcat/.local/share/nvm/v20.10.0/lib/node_modules/typescript/lib"
	local function check_dir(path)
		found_ts = util.path.join(path, "node_modules", "typescript", "lib")
		if util.path.exists(found_ts) then
			return path
		end
	end

	if util.search_ancestors(root_dir, check_dir) then
		return found_ts
	else
		return global_ts
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.workspace = {
	didChangeWatchedFiles = {
		dynamicRegistration = true,
	},
}

--  ╭──────────────────────────────────────────────────────────╮
--  │                       Volar Config                       │
--  ╰──────────────────────────────────────────────────────────╯

local filetypes = have_vue and { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
	or { "vue" }

local init_options = {}

local on_new_config = function(new_config, new_root_dir)
	new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
end

local on_attach = function(client)
	-- NOTE: close volar format
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

local root_dir = require("lspconfig").util.root_pattern("package.json")

local settings = {
	vue = {
		complete = {
			casing = {
				props = "autoKebab",
				tags = "autoPascal",
			},
		},
	},
	typescript = {
		preferences = {
			-- "relative" | "non-relative" | "auto" | "shortest"(not sure)
			importModuleSpecifier = "non-relative",
		},
	},
}

M.capabilities = capabilities
M.filetypes = filetypes
M.init_options = init_options
M.on_attach = on_attach
M.on_new_config = on_new_config
M.root_dir = root_dir
M.settings = settings

return M
