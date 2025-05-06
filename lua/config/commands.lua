-- lua/config/commands.lua

local quitFunction = {}

function quitFunction.setup()
  -- Capital :Q
  vim.api.nvim_create_user_command("Q", function(opts)
    vim.cmd("quit" .. (opts.bang and "!" or ""))
  end, { bang = true })

  -- Capital :W
  vim.api.nvim_create_user_command("W", function(opts)
    vim.cmd("write" .. (opts.bang and "!" or "") .. " " .. (opts.args or ""))
  end, {
    bang = true,
    nargs = "?",
    complete = "file",
  })

  -- Capital :Wq
  vim.api.nvim_create_user_command("Wq", function(opts)
    vim.cmd("wq" .. (opts.bang and "!" or "") .. " " .. (opts.args or ""))
  end, {
    bang = true,
    nargs = "?",
    complete = "file",
  })

  -- Capital :WQ
  vim.api.nvim_create_user_command("WQ", function(opts)
    vim.cmd("wq" .. (opts.bang and "!" or "") .. " " .. (opts.args or ""))
  end, {
    bang = true,
    nargs = "?",
    complete = "file",
  })
end

return quitFunction
