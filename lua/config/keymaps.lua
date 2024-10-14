-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- enter normal mode with jj
keymap.set("i", "jk", "<Esc>", opts)

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { noremap = true, silent = true, desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { noremap = true, silent = true, desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { noremap = true, silent = true, desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { noremap = true, silent = true, desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { noremap = true, silent = true, desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<Return>", { noremap = true, silent = true, desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { noremap = true, silent = true, desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { noremap = true, silent = true, desc = "Go to previous tab" }) --  go to previous tab
keymap.set(
  "n",
  "<leader>tf",
  "<cmd>tabnew %<CR>",
  { noremap = true, silent = true, desc = "Open current buffer in new tab" }
) --  move current buffer to new tab

keymap.set("n", "x", '"_x') -- "dont save delete char to the clipboard
keymap.set("n", "cw", '"_cw') -- dont save the deleted word to the clipboard
keymap.set("n", "ciw", '"_ciw') -- dont save the deleted word to the clipboard

-- Cursor movement
keymap.set("n", "gb", "''", { noremap = true, silent = true, desc = "go back to previous cursor" })
