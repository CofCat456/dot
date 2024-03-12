local M = {}

local function get_npm_global_path()
	local handle = io.popen("npm root -g")
	local result = handle:read("*a")
	handle:close()
	-- 去除结果字符串末尾的换行符
	result = string.gsub(result, "[\r\n]+$", "")
	return result
end

M.get_npm_global_path = get_npm_global_path

return M
