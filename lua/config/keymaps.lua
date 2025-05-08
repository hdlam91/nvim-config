-- lua/config/keymaps.lua

local keymaps = {}

function keymaps.setup()
  -- Define <D-k> as a prefix key for comments
  vim.keymap.set("n", "<C-k>", "<Nop>", { noremap = true }) -- clear default
  vim.keymap.set("n", "<C-k><C-c>", function()
    require("Comment.api").toggle.linewise.current()
  end, { noremap = true, silent = true })

  -- Visual mode support
  vim.keymap.set("v", "<C-k><C-c>", "<Esc><Cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { noremap = true, silent = true })

  -- Tree toggle
  vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { noremap = true, silent = true })

  -- Fuzzy search
  vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<C-f>", ":Telescope live_grep<CR>", { noremap = true, silent = true })


  -- Emmet
  vim.g.user_emmet_leader_key = "<C-e>"

end

return keymaps
