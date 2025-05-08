local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- Theme
  { "folke/tokyonight.nvim" },

  -- Emmet
  {
    "mattn/emmet-vim",
    ft = {
      "html",
      "css",
      "typescript",
      "typescriptreact",
      "javascriptreact",
      "angular",
      "javascript",
    },
  },

  -- Editor config
  { "gpanders/editorconfig.nvim" },

  -- Blank lines
  {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("config.blankline").setup()
  end,
  },

  -- LSP and Completion
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Treesitter (syntax highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("config.nvimTree").setup()
    end,
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("config.bufferline").setup()
    end,
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },

  -- Telescope (fuzzy finder)
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Statusline
  { "nvim-lualine/lualine.nvim",
    config = function ()
      require("lualine").setup()
    end
  },

  -- Git integration
  { "lewis6991/gitsigns.nvim",
    config = function ()
      require("gitsigns").setup()
    end
  },

  -- LSP
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },
})

