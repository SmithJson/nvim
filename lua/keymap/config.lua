local function check_back_space()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

_G.enhance_jk_move = function(key)
    if packer_plugins['accelerated-jk'] and not packer_plugins['accelerated-jk'].loaded then
        vim.cmd [[packadd accelerated-jk]]
    end
    local map = key == 'j' and '<Plug>(accelerated_jk_gj)' or '<Plug>(accelerated_jk_gk)'
    return t(map)
end

_G.enhance_ft_move = function(key)
    if not packer_plugins['vim-eft'].loaded then
        vim.cmd [[packadd vim-eft]]
    end
    local map = {
        f = '<Plug>(eft-f)',
        F = '<Plug>(eft-F)',
        [';'] = '<Plug>(eft-repeat)'
    }
    return t(map[key])
end

local is_nvim_tree_open = false

-- Expand focus folder only
_G.nvim_tree_toggle = function ()
    local is_nvim_tree_loaded, nvim_tree = pcall(require, 'nvim-tree')

    if vim.api.nvim_buf_get_name(0) == "" then
        vim.cmd("NvimTreeToggle")
        is_nvim_tree_open = is_nvim_tree_open and false or true;
        print(is_nvim_tree_open)
        -- is_nvim_tree_open = is_nvim_tree_open ? true : false
        return
    end

    if is_nvim_tree_loaded then
        if is_nvim_tree_open then
            require("nvim-tree.view").close()
            require('nvim-tree.lib').collapse_all()
            is_nvim_tree_open = false
        else
            nvim_tree.find_file(true)
            is_nvim_tree_open = true
        end
    end
end
