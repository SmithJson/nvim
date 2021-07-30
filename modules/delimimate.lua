-- 删除 <  > 的匹配，HTML 标签<补全非常恶心
vim.g.delimitMate_matchpairs = "(:),[:],{:}"
vim.g.delimitMate_expand_cr = 0
vim.g.delimitMate_expand_space = 1
vim.g.delimitMate_smart_quotes = 1
vim.g.delimitMate_expand_inside_quotes = 0
vim.api.nvim_command('au FileType markdown let b:delimitMate_nesting_quotes = ["`"]')
