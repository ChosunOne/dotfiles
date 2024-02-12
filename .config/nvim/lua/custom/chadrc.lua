-- This file contains overrides for all settings.  If you want something to be potentially overridden, use init.lua
---@type ChadrcConfig
local M = {}

M.ui = { theme = 'catppuccin' }
M.plugins = 'custom.plugins'
M.mappings = require('custom.mappings')

return M
