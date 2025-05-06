-- Example: ~/.config/nvim/init.lua

vim.g.mapleader = "-"

vim.o.number = true
vim.o.relativenumber = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

--vim.cmd("colorscheme tokyonight")

-- Load LSP, Completion, Treesitter etc.
require("config.lazy") -- sets up lazy.nvim and plugins
require("config.lsp")  -- sets up lspconfig after plugins are loaded
require("config.cmp")
require("config.treesitter")
require("nvim-tree").setup()
require("lualine").setup()
require("gitsigns").setup()
require("config.commands").setup()



-- Define <D-k> as a prefix key for comments
vim.keymap.set("n", "<M-k>", "<Nop>", { noremap = true }) -- clear default
vim.keymap.set("n", "<M-k><M-c>", function()
require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })

-- Visual mode support
vim.keymap.set("v", "<M-k><M-c>", "<Esc><Cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { noremap = true, silent = true })



-- Tree toggle
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Fuzzy search
vim.keymap.set("n", "<M-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-f>", ":Telescope live_grep<CR>", { noremap = true, silent = true })


-- Emmet
vim.g.user_emmet_leader_key = "<C-e>"

