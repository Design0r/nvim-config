require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP code action" })
map("n", "gr", function()
  vim.lsp.buf.references()
end, { desc = "LSP references" })
map("n", "<leader>ls", function()
  vim.lsp.buf.signature_help()
end, { desc = "LSP signature help" })

map("v", ">", ">gv", { desc = "indent" })
map("v", "<", "<gv", { desc = "unindent" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
