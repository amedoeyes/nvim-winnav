local config = require("winnav.config")

local M = {}

---@param opts WinNav.Config
M.setup = function(opts)
	config.setup(opts)
end

---@param dir "h"|"j"|"k"|"l"
M.nav = function(dir)
	if vim.fn.winnr(dir) == vim.fn.winnr() then
		local command = vim.deepcopy(config.options.focus_command)
		table.insert(command, config.options.direction_map[dir])
		vim.system(command)
	else
		vim.cmd("wincmd " .. dir)
	end
end

return M
