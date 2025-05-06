local lspconfig = require("lspconfig")

local servers = { "pyright", "ts_ls", "lua_ls" } -- add more as needed

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "pyright", "ts_ls", "lua_ls" },
}

