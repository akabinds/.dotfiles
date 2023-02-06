local telescope = require("telescope")
local builtin = require("telescope.builtin")
local trouble = require("trouble.providers.telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	}
})

telescope.load_extension("lazygit")
telescope.load_extension("noice")

vim.keymap.set("n", "<leader>af", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function() 
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
