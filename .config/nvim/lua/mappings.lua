require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map({"n", "v"}, "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
map("n", "<leader>Y", "\"+Y", { desc = "Yank line to system clipboard" })
map({"n", "v"}, "<leader>d", "\"_d")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope find diagnostics' })
