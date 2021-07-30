local saga = require 'lspsaga'
saga.init_lsp_saga()

require('lspkind').init({
    -- enables text annotations
    with_text = true,
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    -- default: 'default'
    preset = 'codicons',
    -- override preset symbols
    symbol_map = {
        Text = '',
        Method = 'ƒ',
        Function = '',
        Constructor = '',
        Variable = '',
        Class = '',
        Interface = 'ﰮ',
        Module = '',
        Property = '',
        Unit = '',
        Value = '',
        Enum = '了',
        Keyword = '',
        Snippet = '﬌',
        Color = '',
        File = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = ''
    }
})

 require('compe').setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
        path = true,
        buffer = true,
        calc = true,
        spell = true,
        tags = true,

        orgmode = true,
        snippetSupport = true,
        nvim_lsp = true,
        nvim_lua = true,
        treesitter = true,
        vsnip = true,
        ultisnips = true,
        tabnine = {
            max_line = 1000,
            max_num_results = 6,
            priority = 5000,
            show_prediction_strength = true,
            sort = false,
            ignore_pattern = '[(]'
        }
    }
}

local function setup_servers()
  require'lspinstall'.setup{
    on_attach = require'completion'.on_attach
  }
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end
setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end


