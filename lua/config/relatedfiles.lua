-- lua/config/relatedfiles.lua
local relatedFiles = {}

local function switch_file(extensions)
  local file = vim.fn.expand("%:t:r")       -- get filename without extension
  local dir = vim.fn.expand("%:p:h")        -- current file's directory

  for _, ext in ipairs(extensions) do
    local candidate = string.format("%s/%s.%s", dir, file, ext)
    if vim.fn.filereadable(candidate) == 1 then
      vim.cmd("edit " .. candidate)
      return
    end
  end

  vim.notify("No related file found with extensions: " .. table.concat(extensions, ", "), vim.log.levels.WARN)
end

function relatedFiles.setup()
  -- Switch to template
  vim.keymap.set("n", "<leader>th", function() switch_file({ "html" }) end, { desc = "Go to .html" })

  -- Switch to stylesheet (scss > sass > css)
  vim.keymap.set("n", "<leader>tc", function() switch_file({ "scss", "sass", "css" }) end, { desc = "Go to .scss/.sass/.css" })

  -- Switch to TypeScript file
  vim.keymap.set("n", "<leader>ts", function() switch_file({ "ts" }) end, { desc = "Go to .ts" })
end

return relatedFiles

