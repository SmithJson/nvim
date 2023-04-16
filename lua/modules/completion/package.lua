local conf = require('modules.completion.config')

local enable_lsp_filetype = { 'go', 'lua', 'sh', 'rust', 'c', 'cpp', 'zig', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json', 'python', 'vue' }
local loaded = false
local function diag_config()
    local signs = {
        Error = ' ',
        Warn = ' ',
        Info = ' ',
        Hint = ' ',
    }
    for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({
        signs = true,
        severity_sort = true,
        virtual_text = true,
    })

    --disable diagnostic in neovim test file *_spec.lua
    vim.api.nvim_create_autocmd('FileType', {
        pattern = 'lua',
        callback = function(opt)
            local fname = vim.api.nvim_buf_get_name(opt.buf)
            if fname:find('%w_spec%.lua') then
                vim.diagnostic.disable(opt.buf)
            end
        end,
    })
end

packadd({
    'neovim/nvim-lspconfig',
    ft = enable_lsp_filetype,
    event = "BufReadPre",
    config = function()
        if not loaded then
            diag_config()
            loaded = true
        end
        require('modules.completion.lsp')
    end,
})

packadd({
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter", "CmdlineEnter" },
    config = conf.nvim_cmp,
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
    },
})

packadd({
    'L3MON4D3/LuaSnip',
    event = 'InsertCharPre',
    config = conf.lua_snip,
})

packadd({
    'williamboman/mason.nvim',
    config = function()
        require('mason').setup()
    end
})

packadd({
    'williamboman/mason-lspconfig.nvim',
    config = function()
        require('mason-lspconfig').setup({
            ensure_installed = { 'tsserver', 'vuels' },
            automatic_installation = true
        })
    end
})

packadd({
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    config = function()
        require('lspsaga').setup({
            symbol_in_winbar = {
                ignore_patterns = { '%w_spec' },
            },
        })
    end,
})

packadd({
    'jose-elias-alvarez/null-ls.nvim',
    config = conf.null_ls
})

packadd({
    'j-hui/fidget.nvim',
    config = function()
        require "fidget".setup {}
    end
})
