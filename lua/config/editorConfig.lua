-- lua/config/editorConfig.lua

local editorConfig = {}

function editorConfig.setup()
  vim.g.mapleader = "-"

  vim.o.number = true
  vim.o.relativenumber = false
  vim.o.tabstop = 2
  vim.o.shiftwidth = 2
  vim.o.expandtab = true
end

return editorConfig
