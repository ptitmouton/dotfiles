local setup, treesitter = pcall(require, 'nvim-treesitter.configs')
if not setup then
  return
end

treesitter.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "elixir",
    "go",
    "gomod",
    "graphql",
    'gitignore',
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "regex",
    "rust",
    "toml",
    "tsx",
    "typescript",
    "yaml",
  },
  auto_install = true,
  sync_install = true,
}
