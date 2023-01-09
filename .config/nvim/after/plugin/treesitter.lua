require'nvim-treesitter.configs'.setup {
  ensure_installed = { "help", "rust", "c", "lua", "python", "llvm", "zig", "elixir", "bash", "c_sharp", "graphql", "http", "json", "javascript", "typescript", "make", "proto", "prisma", "regex", "yaml" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
