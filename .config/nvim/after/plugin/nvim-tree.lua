local nvimtree = require("nvim-tree")

nvimtree.setup()

vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>c", vim.cmd.NvimTreeCollapse)
