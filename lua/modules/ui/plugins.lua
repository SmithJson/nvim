local ui = {}
local conf = require("modules.ui.config")

-- ui['liuchengxu/space-vim-theme'] = {
--   config = function ()
--       vim.cmd('colorscheme space_vim_theme')
--   end
-- }

ui["SmithJson/zephyr-nvim"] = {
    config = function()
        vim.cmd("colorscheme zephyr")
    end
}

-- ui['ayu-theme/ayu-vim'] = {
--   config = function ()
--       vim.cmd('let ayucolor="mirage"')
--       vim.cmd('colorscheme ayu')
--   end
-- }

ui["glepnir/dashboard-nvim"] = {
    config = conf.dashboard,
    run = "cargo install ripgrep"
}

ui["yamatsum/nvim-nonicons"] = {
    branch = "main",
    requires = "kyazdani42/nvim-web-devicons"
}

ui["lukas-reineke/indent-blankline.nvim"] = {
    event = "BufRead",
    config = conf.indent_blakline
}

ui["noib3/nvim-cokeline"] = {
    requires = "kyazdani42/nvim-web-devicons",
    config = conf.cokeline,
}

ui["kyazdani42/nvim-tree.lua"] = {
    config = conf.nvim_tree,
    requires = "yamatsum/nvim-nonicons"
}

ui["airblade/vim-rooter"] = {
    config = conf.rooter
}

ui["SmithJson/bubbly.nvim"] = {
    branch = "dev_lsp",
    config = conf.bubbly,
    requires = "nvim-lua/lsp-status.nvim"
}

ui["lewis6991/gitsigns.nvim"] = {
    event = {"BufRead", "BufNewFile"},
    config = conf.gitsigns,
    requires = {"nvim-lua/plenary.nvim", opt = true}
}

ui["sindrets/diffview.nvim"] = {
    config = conf.diffview,
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"kyazdani42/nvim-web-devicons"}
    },
    cmd = {
        "DiffviewOpen",
        "DiffviewFileHistory",
        "DiffviewClose",
        "DiffviewToggleFiles",
        "DiffviewFocusFiles",
        "DiffviewRefresh"
    },
    after = "plenary.nvim"
}

return ui
