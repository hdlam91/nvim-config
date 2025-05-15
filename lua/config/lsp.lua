local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local telescope_builtin = require('telescope.builtin')
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
   -- Go to definition
  vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, opts)
  -- Go to implementation
  vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations, opts)
  -- Find references
  vim.keymap.set("n", "gr", telescope_builtin.lsp_references, opts)
  -- Go to type definition
  vim.keymap.set("n", "gy", telescope_builtin.lsp_type_definitions, opts)
  -- Show hover (documentation)
  vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
  -- Rename symbol
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  -- Code actions
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  -- Show diagnostics for line
  vim.keymap.set("n", "<leader>dl", telescope_builtin.diagnostics, opts)
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
