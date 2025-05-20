-- init.lua
require("config.editorconfig").setup()

-- Load LSP, Completion, Treesitter etc.
require("config.lazy") -- sets up lazy.nvim and plugins
require("config.lsp")  -- sets up lspconfig after plugins are loaded
require("config.cmp")
require("config.treesitter")
require("config.commands").setup()
require("config.keymaps").setup()
require("config.relatedfiles").setup()

