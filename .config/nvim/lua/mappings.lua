require "nvchad.mappings"

local map = vim.keymap.set
local unmap = vim.keymap.del;

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- clipboard
unmap("n", "<leader>pt")
map("n", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
map("v", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
map("n", "<leader>p", "\"+p", { desc = "Paste from system clipboard" })
map("v", "<leader>P", "\"+P", { desc = "Paste before from system clipboard" })
map("v", "<leader>p", "\"+p", { desc = "Paste from system clipboard" })
