require("nvim-tree").setup({
	view = {
		adaptive_size = true,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = " ",
			info = " ",
			warning = " ",
			error = " ",
		},
	},
	renderer = {
		highlight_git = true,
		highlight_opened_files = "all",
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
	}
})

vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>c", vim.cmd.NvimTreeCollapse)
vim.keymap.set("n", "<leader>f", vim.cmd.NvimTreeFocus)
