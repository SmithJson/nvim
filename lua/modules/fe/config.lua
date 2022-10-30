local config  = {}

function config.emmet()
    vim.g.user_emmet_complete_tag = 1
    vim.g.user_emmet_install_global = 1
    vim.g.user_emmet_install_command = 1
    vim.g.user_emmet_mode = 'i'
end

function config.lint()
    require('lint').linters_by_ft = {
        javascript = {'eslint'},
        javascriptreact = {'eslint'},
        typescript = {'eslint'},
        typescriptreact = {'eslint'},
        vue = {'eslint'}
     }
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWrite" }, {
        callback = function()
          require("lint").try_lint()
        end,
    })
end

return config
