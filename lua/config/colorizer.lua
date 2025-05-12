-- lua/config/colorizer.lua
local colorizer = {}

function colorizer.setup()
  require("colorizer").setup({
    filetypes = { "*" }, -- enable for all filetypes
    user_default_options = {
      RGB      = true, -- #RGB hex codes
      RRGGBB   = true, -- #RRGGBB hex codes
      names    = true, -- "Blue" or "blue"
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      rgb_fn   = true, -- CSS rgb() and rgba()
      hsl_fn   = true, -- CSS hsl() and hsla()
      css      = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn   = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      tailwind = true, -- Enable tailwind colors
      -- Available modes: foreground, background, virtualtext
      mode     = "background",
    },
  })
end

return colorizer

