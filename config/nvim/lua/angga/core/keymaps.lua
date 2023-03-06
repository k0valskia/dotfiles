vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("n", "<leader>l", ":nohl<CR>")
keymap.set("n", "<leader>w", ":w<CR>")
-- keymap.set("n", "x", '"_x')
-- keymap.set("n", "d", '"_d')

keymap.set("n", "sv", "<C-w>v")
keymap.set("n", "sh", "<C-w>s")
keymap.set("n", "se", "<C-w>=")
keymap.set("n", "sq", ":close<CR>")

keymap.set("n", "<S-t>", ":tabnew<CR>")
keymap.set("n", "<S-q>", ":tabclose<CR>")
keymap.set("n", "<S-l>", ":tabn<CR>")
keymap.set("n", "<S-h>", ":tabp<CR>")

keymap.set("n", "<leader>e", ":Neotree toggle float<CR>")
keymap.set("n", "<leader>r", "<Plug>RestNvim")
keymap.set("n", "<leader>gg", ":ChatGPT<CR>")
