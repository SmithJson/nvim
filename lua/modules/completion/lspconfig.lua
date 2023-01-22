local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()

if not packer_plugins['cmp-nvim-lsp'].loaded then
  vim.cmd([[packadd cmp-nvim-lsp]])
end
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
    prefix = '🔥',
    source = true,
  },
})

lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { 'vim', 'packer_plugins' },
      },
      runtime = { version = 'LuaJIT' },
      workspace = {
        library = vim.list_extend({ [vim.fn.expand('$VIMRUNTIME/lua')] = true }, {}),
      },
    },
  },
})

local servers = {
  'tsserver',
  'vuels'
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities
  })
end
