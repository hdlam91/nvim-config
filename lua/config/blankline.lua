-- lua/config/blankline.lua
local blankline = {}
function blankline.setup()
  vim.opt.list = true
  vim.opt.listchars = {
    space = "⋅",
    tab = "→ ",
    -- Do NOT include `eol`, `trail`, or `leadmultispace`
  }

  require("ibl").setup({
    whitespace = {
      remove_blankline_trail = false,
    },
    indent = {
      char = "│", -- or "▏" or "" if you want no vertical lines
    },
    scope = {
      enabled = false, -- disables scope indicators (if undesired)
    },
  })
end


return blankline
