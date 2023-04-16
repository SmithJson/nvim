local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.enhance_ft_move = function(key)
    local map = {
        f = "<Plug>(eft-f)",
        F = "<Plug>(eft-F)",
        [";"] = "<Plug>(eft-repeat)"
    }
    return t(map[key])
end

local is_nvim_tree_open = false

-- Expand focus folder only
_G.nvim_tree_toggle = function()
    local is_nvim_tree_loaded = pcall(require, "nvim-tree")
    local nvim_tree_api = require("nvim-tree.api")

    if vim.api.nvim_buf_get_name(0) == "" then
        vim.cmd("NvimTreeToggle")
        is_nvim_tree_open = is_nvim_tree_open and false or true
        -- is_nvim_tree_open = is_nvim_tree_open ? true : false
        return
    end

    if is_nvim_tree_loaded then
        if is_nvim_tree_open then
            nvim_tree_api.tree.close()
            nvim_tree_api.tree.collapse_all()
            is_nvim_tree_open = false
        else
            nvim_tree_api.tree.toggle(true)
            is_nvim_tree_open = true
        end
    end
end

_G.set_terminal_keymaps = function()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")