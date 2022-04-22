local config = {}

function config.vim_cursorwod()
    vim.api.nvim_command('augroup user_plugin_cursorword')
    vim.api.nvim_command('autocmd!')
    vim.api.nvim_command('autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0')
    vim.api.nvim_command('autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif')
    vim.api.nvim_command('autocmd InsertEnter * let b:cursorword = 0')
    vim.api.nvim_command('autocmd InsertLeave * let b:cursorword = 1')
    vim.api.nvim_command('augroup END')
end

function config.nvim_colorizer() require('colorizer').setup() end

function config.emmet()
    vim.g.user_emmet_complete_tag = 1
    vim.g.user_emmet_install_global = 1
    vim.g.user_emmet_install_command = 1
    vim.g.user_emmet_mode = 'i'
end

function config.comment()
    local comment_string = require("ts_context_commentstring")

    require("Comment").setup(
    {
        toggler = {
            line = "gcc",
            block = "gCC"
        },
        opleader = {
            line = "gc",
            block = "gC"
        },
        extra = {
            above = "gcO",
            below = "gco",
            eol = "gcA"
        },
        pre_hook = function(ctx)
            local U = require 'Comment.utils'

            local location = nil
            if ctx.ctype == U.ctype.block then
                location = require('ts_context_commentstring.utils').get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = require('ts_context_commentstring.utils').get_visual_start_location()
            end

            return require('ts_context_commentstring.internal').calculate_commentstring {
                key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
                location = location,
            }
        end,
    }
    )
end

return config
