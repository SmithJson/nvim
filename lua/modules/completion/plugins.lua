local completion = {}
local conf = require("modules.completion.config")

completion["neovim/nvim-lspconfig"] = {
    config = conf.nvim_lsp,
    requires = {
        {"hrsh7th/nvim-cmp", config = conf.compe},
        {"hrsh7th/vim-vsnip-integ", config = conf.vsnip},
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/cmp-buffer"},
        {"hrsh7th/cmp-path"},
        {"hrsh7th/cmp-cmdline"},
        {"hrsh7th/cmp-vsnip"},
        {"hrsh7th/cmp-nvim-lsp-signature-help"},
        {"onsails/lspkind-nvim"},
        {"hrsh7th/vim-vsnip"},
        {"rafamadriz/friendly-snippets"}
    }
}

completion["williamboman/nvim-lsp-installer"] = {
    opt = true,
    cmd = {"LspInstall", "LspUninstall"}
}

completion["j-hui/fidget.nvim"] = {
    config = function()
        require "fidget".setup {}
    end
}

completion["tami5/lspsaga.nvim"] = {
    opt = true,
    cmd = "Lspsaga",
    config = conf.saga
}

completion["windwp/nvim-autopairs"] = {
    opt = true,
    event = "InsertCharPre",
    after = "nvim-lspconfig",
    config = conf.autopairs
}

return completion
