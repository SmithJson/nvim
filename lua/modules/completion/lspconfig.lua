if not packer_plugins['nvim-lspconfig'].loaded then
    vim.cmd [[packadd nvim-lspconfig]]
end

if not packer_plugins['lspsaga.nvim'].loaded then
    vim.cmd [[packadd lspsaga.nvim]]
end

if not packer_plugins['nvim-lspinstall'].loaded then
    vim.cmd [[packadd nvim-lspinstall]]
end

if not packer_plugins['lsp_signature.nvim'].loaded then
    vim.cmd [[packadd lsp_signature.nvim]]
end

local nvim_lsp = require('lspconfig')
local lsp_install = require('lspinstall')
local saga = require('lspsaga')
local capabilities = vim.lsp.protocol.make_client_capabilities()

saga.init_lsp_saga({
    code_action_icon = ' ',
    code_action_prompt = {
        enable = true,
        sign = false,
        virtual_text = true,
    }
})

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'}
}

local function setup_servers()
    lsp_install.setup()
    local servers = lsp_install.installed_servers()
    for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup {
            capabilities = capabilities,
            on_attach = function()
                require('lsp_signature').on_attach({
                    bind = true,
                    use_lspsaga = false,
                    floating_window = true,
                    fix_pos = true,
                    hint_enable = true,
                    hi_parameter = "Search",
                    handler_opts = {"double"}
                })
            end
        }
    end
end

lsp_install.post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

setup_servers()

