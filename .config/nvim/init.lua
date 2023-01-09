require('binds')

vim.cmd [[colorscheme tokyonight-night]]

local set = vim.opt
local g = vim.g

set.number = true
set.relativenumber = true
set.autoindent = true
set.tabstop = 4
set.shiftwidth = 4
set.smarttab = true
set.softtabstop = 4
set.mouse="a"
set.hlsearch = false
set.incsearch = true
set.updatetime = 50
set.termguicolors = true

g.mapleader = " "
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
