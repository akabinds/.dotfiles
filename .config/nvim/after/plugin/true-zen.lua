local truezen = require("true-zen")

vim.keymap.set("n", "<leader>zf", truezen.focus, { noremap = true })
vim.keymap.set("n", "<leader>zm", truezen.minimalist, { noremap = true })

