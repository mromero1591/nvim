-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exist insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- dont save deleted characters
keymap.set("n", "x", '"_x') -- "dont save delete char to the clipboard
keymap.set("n", "cw", '"_cw') -- dont save the deleted word to the clipboard
keymap.set("n", "ciw", '"_ciw') -- dont save the deleted word to the clipboard

keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

-- Show diagnostics in a popup for current line
vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.open_float({ scope = "line", border = "rounded" })
end, { desc = "Show line diagnostics" })
