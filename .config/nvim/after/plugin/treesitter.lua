require("nvim-treesitter.configs").setup({
  ensure_installed = { "help", "rust", "c", "lua", "python", "llvm", "bash", "json", "make", "regex", "yaml" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
