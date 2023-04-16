local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- npm i -g typescript
-- npm i -g typescript-langauge-server
lspconfig.tsserver.setup({
    capabilities = capabilities,
    single_file_support = true
})

-- npm install -g vls
lspconfig.vuels.setup({
    capabilities = capabilities,
    single_file_support = true
})