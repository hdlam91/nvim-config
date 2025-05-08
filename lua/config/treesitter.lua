require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "dockerfile",
    "lua",
    "python",
    "javascript",
    "json",
    "json5",
    "html",
    "css",
    "markdown",
    "markdown_inline",
  },
  highlight = { enable = true },
  indent = { enable = true },
})

