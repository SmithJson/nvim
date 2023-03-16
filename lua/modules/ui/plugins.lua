local package = require('core.pack').package
local conf = require('modules.ui.config')

-- package({
--     'Shatur/neovim-ayu',
--     config = function ()
--         vim.cmd([[colorscheme ayu-mirage]])
--     end
-- })

-- package({
--     'navarasu/onedark.nvim',
--     config = function ()
--         vim.cmd([[colorscheme ayu-mirage]])
--     end
-- })

-- package({
--   'glepnir/zephyr-nvim',
--   config = function ()
--       vim.cmd([[colorscheme zephyr]])
--   end
-- })

package({
  'Mofiqul/vscode.nvim',
  config = function ()
    require('vscode').setup({
        transparent = false,
        italic_comments = false,
        disable_nvimtree_bg = false,
        color_overrides = {
            -- vscLightBlue = '#03acf1',
            -- vscBlue = '#FB678E',
            -- vscYellow = '#feb380',
            -- vscPink = '#FB678E',
            -- vscOrange = '#2b9970',
            -- vscBlueGreen = '#03acf1'

            vscLightBlue = '#03acf1',
            vscBlue = '#e3616b',
            vscYellow = '#feb380',
            vscPink = '#e3616b',
            vscOrange = '#2b9970',
            vscBlueGreen = '#d8b1d4'
        }
    })
    require('vscode').load()
  end
})

package({
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = conf.dashboard
})

package({
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = conf.galaxyline,
    requires = 'kyazdani42/nvim-web-devicons',
})

local enable_indent_filetype = {
    'go',
    'lua',
    'sh',
    'rust',
    'cpp',
    'vue',
    'typescript',
    'javascript',
    'json',
    'python',
}
package({
    'lukas-reineke/indent-blankline.nvim',
    ft = enable_indent_filetype,
    config = conf.indent_blankline,
})

package({
    'lewis6991/gitsigns.nvim',
    event = { 'BufRead', 'BufNewFile' },
    config = conf.gitsigns,
    requires = {{ 'nvim-lua/plenary.nvim', opt = true }}
})

package({
    'sindrets/diffview.nvim',
    after = 'plenary.nvim',
    cmd = {
        "DiffviewOpen",
        "DiffviewFileHistory",
        "DiffviewClose",
        "DiffviewToggleFiles",
        "DiffviewFocusFiles",
        "DiffviewRefresh"
    },
    requires = {
        {'nvim-lua/plenary.nvim', opt = true},
        {'kyazdani42/nvim-web-devicons', opt = true}
    }
})

package({
    'nvim-tree/nvim-tree.lua',
    requires = {{ 'nvim-tree/nvim-web-devicons' }},
    config = function()
        require('nvim-tree').setup({
            trash = {
                cmd = "trash",
                require_confirm = true,
            }
        })
    end
})

package({
    'akinsho/bufferline.nvim',
    event = "BufReadPre",
    config = conf.bufferline,
    requires = {{ 'kyazdani42/nvim-web-devicons' }}
})
