local M = {}

---@class WinNav.Config
local defaults = {
	---@type table<string>
	focus_command = {},
	---@class WinNav.Config.DirectionMap
	---@field h string
	---@field l string
	---@field k string
	---@field j string
	direction_map = {},
}

---@type WinNav.Config
M.options = {}

---@param opts WinNav.Config
M.setup = function(opts)
	M.options = vim.tbl_deep_extend("force", {}, defaults, opts or {})
end

return M
