---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- M.gopher = {
--   plugin = true,
--   n = {
--     ["<leader>gsj"] = {
--       "<cmd> GoTagAdd json <CR>",
--       "Add JSON Struct Tags",
--     },
--     ["<leader>gsy"] = {
--       "<cmd> GoTagAdd yaml <CR>",
--       "Add YAML Struct Tags",
--     },
--   },
-- }

return M
