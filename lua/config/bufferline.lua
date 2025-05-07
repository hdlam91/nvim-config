-- lua/config/bufferline.lua

local bufferLine = {}

function bufferLine.setup()
  require("bufferline").setup({
    options = {
      mode = "buffers",
      diagnostics = "nvim_lsp",
      separator_style = "slant",
      show_buffer_close_icons = true,
      show_close_icon = false,
      always_show_bufferline = true,
    },
    highlights = {
      fill = {
        bg = "#1e1e1e", -- background of the bufferline area
      },
      background = {
        fg = "#bbbbbb", -- buffer name color (unfocused)
        bg = "#2c2c2c",
      },
      buffer_selected = {
        fg = "#ffffff", -- focused buffer name
        bg = "#3c3c3c",
        bold = true,
      },
      separator = {
        fg = "#2c2c2c",
        bg = "#1e1e1e",
      },
      separator_selected = {
        fg = "#3c3c3c",
        bg = "#3c3c3c",
      },
      modified = {
        fg = "#e0af68",
        bg = "#2c2c2c",
      },
      modified_selected = {
        fg = "#e0af68",
        bg = "#3c3c3c",
      },
    },
  })

  -- Keybindings
  local map = vim.keymap.set
  map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
  map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
  map("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Delete buffer" })
  map("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })
end

return bufferLine
