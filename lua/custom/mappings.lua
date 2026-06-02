---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-l>"] = { "<cmd> BufExplorer <CR>", "Buffer Explorer" },
  },
}

-- more keybinds!
-- nmap <c-l> :BufExplorer<CR>

return M
