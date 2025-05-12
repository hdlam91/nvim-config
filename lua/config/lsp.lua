local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

mason.setup()
mason_lspconfig.setup({
  ensure_installed = { "ts_ls", "lua_ls", "angularls", "pyright", "cssls" },
})

-- Common capabilities for all LSP servers
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Common on_attach function for keybindings
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true }
  local map = vim.api.nvim_buf_set_keymap
  map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
end

-- Setup Angular LSP specifically
lspconfig.angularls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    "./node_modules",
    "--ngProbeLocations",
    "./node_modules",
  },
  root_dir = lspconfig.util.root_pattern("angular.json", "project.json"),
})

-- Setup other servers
local servers = { "lua_ls", "pyright", "cssls" }
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end
