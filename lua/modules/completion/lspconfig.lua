if not packer_plugins['nvim-lspconfig'].loaded then
    vim.cmd [[packadd nvim-lspconfig]]
end

if not packer_plugins['lspsaga.nvim'].loaded then
    vim.cmd [[packadd lspsaga.nvim]]
end

if not packer_plugins['nvim-lsp-installer'].loaded then
    vim.cmd [[packadd nvim-lsp-installer]]
end

-- local nvim_lsp = require('lspconfig')
local saga = require('lspsaga')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
    local lsp_installer_servers = require'nvim-lsp-installer.servers'
    local lsp_servers = {"clangd", "cssls", "dockerls", "html", "jsonls", "tsserver", "sumneko_lua", "intelephense", "jedi_language_server", "rust_analyzer", "vuels"}

    for _, lsp in ipairs(lsp_servers) do
        local server_available, requested_server = lsp_installer_servers.get_server(lsp)
        if server_available then
            requested_server:on_ready(function ()
                local opts = {
                    capabilities = capabilities,
                    flags = {
                        debounce_text_changes = 0,
                    },
                }
                requested_server:setup(opts)
            end)
            if not requested_server:is_installed() then
                -- Queue the server to be installed
                requested_server:install()
            end
        end
    end
end

setup_servers()

