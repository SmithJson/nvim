local lspconfig = require('lspconfig')

-- local capabilities = vim.lsp.protocol.make_client_capabilities()

if not packer_plugins['cmp-nvim-lsp'].loaded then
  vim.cmd([[packadd cmp-nvim-lsp]])
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local signs = {
  Error = ' ',
  Warn = ' ',
  Info = ' ',
  Hint = ' ',
}
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  virtual_text = {
    prefix = ' ',
    source = true,
  },
})

local servers = {
  'tsserver',
  'vuels'
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
    single_file_support = true
  })
end
