return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"folke/todo-comments.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					path_display = { "smart" },
					wrap_results = true,
					layout_strategy = "horizontal",
					layout_config = { prompt_position = "top" },
					sorting_strategy = "ascending",
					winblend = 0,

					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
			})

			telescope.load_extension("fzf")

			-- set keymaps
			local keymap = vim.keymap -- for conciseness

			keymap.set("n", ";f", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
			keymap.set("n", ";r", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
			keymap.set("n", ";R", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
			keymap.set("n", ";t", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
			keymap.set("n", ";;", "<cmd>Telescope resume<cr>", { desc = "Resume the previous telescope picker" })
			keymap.set(
				"n",
				";s",
				"<cmd>Telescope treesitter<cr>",
				{ desc = "Find Treesitter symbols with telescope picker" }
			)
			keymap.set("n", ";b", "<cmd>Telescope buffers<cr>", { desc = "List Open Buffers telescope picker" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			-- This is your opts table
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
