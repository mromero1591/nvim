-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "x", '"_x') -- delete single character without copying into register
keymap.set("n", "cw", '"_cw') -- dont save the deleted word to the clipboard
keymap.set("n", "ciw", '"_ciw') -- dont save the deleted word to the clipboard

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Selects all text" })

-- Cursor movement
keymap.set("n", "<leader>gb", "''", { noremap = true, silent = true, desc = "go back to previous cursor" })

-- Define a global variable to keep track of the current state (next or prev)
local toggle_buffer = true

-- Create a function to toggle between :bnext and :bprev
function ToggleBuffer()
	if toggle_buffer then
		vim.cmd("bnext")
	else
		vim.cmd("bprev")
	end
	toggle_buffer = not toggle_buffer
end

-- Map the key combination 'bb' to the ToggleBuffer function
vim.api.nvim_set_keymap("n", "<leader>bb", ":lua ToggleBuffer()<CR>", { noremap = true, silent = true })
