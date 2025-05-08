-- lua/config/nvimTree.lua
local nvimTree = {}
function nvimTree.setup()
  require("nvim-tree").setup({
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    view = {
      width = 30,
      side = "left",
    },
    renderer = {
      highlight_git = true,
      icons = {
        show = {
          git = true,
          folder = true,
          file = true,
          folder_arrow = true,
        },
      },
    },
    git = {
      enable = true,
    },
    filters = {
      dotfiles = true,  -- Hide hidden files permanently
    },
  })
end


return nvimTree
