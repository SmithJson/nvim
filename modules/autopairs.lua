require('nvim-autopairs').setup({
    disable_filetype = {"TelescopePrompt"},
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
    enable_moveright = true,
    -- add bracket pairs after quote
    enable_afterquote = true,
    -- check bracket in same line
    enable_check_bracket_line = true,
    check_ts = true
})

require("nvim-autopairs.completion.compe").setup({
    map_cr = true,
    map_complete = true
})
