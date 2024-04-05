local M = {}

local read_json_file = function(filename)
	local Path = require("plenary.path")

	local path = Path:new(filename)

	if not path:exists() then
		return nil
	end

	local json_contents = path:read()
	local json = vim.fn.json_decode(json_contents)

	return json
end

local read_package_json = function()
	return read_json_file("package.json")
end

local is_npm_package_installed = function(package)
	local package_json = read_package_json()
	if not package_json then
		return false
	end

	if package_json.peerDependencies and package_json.peerDependencies[package] then
		return true
	end

	if package_json.dependencies and package_json.dependencies[package] then
		return true
	end

	if package_json.devDependencies and package_json.devDependencies[package] then
		return true
	end

	return false
end

-- Is Vue Project
M.have_vue = function()
	return is_npm_package_installed("vue") or is_npm_package_installed("vite")
end

M.have_tailwindcss = function()
	return is_npm_package_installed("tailwindcss") or is_npm_package_installed("@nuxtjs/tailwindcss")
end

return M
