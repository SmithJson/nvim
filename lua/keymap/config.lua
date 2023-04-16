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