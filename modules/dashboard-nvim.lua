-- create ascii text：http://patorjk.com/software/taag/
local home = os.getenv('HOME')
vim.g.dashboard_preview_command = 'cat'
vim.g.dashboard_preview_file = home .. '/.config/nvim/static/neovim.cat'
vim.g.dashboard_preview_file_height = 20
vim.g.dashboard_preview_file_width = 40
-- vim.g.dashboard_preview_pipeline = 'lolcat'
vim.g.dashboard_default_executive ='telescope'
vim.g.dashboard_footer_icon = '🦸 '
-- vim.g.dashboard_custom_header = {
--     '',
--     '',
--     '███████╗██╗   ██╗ █████╗     ██╗     ██╗██╗     ██╗████████╗██╗  ██╗',
--     '██╔════╝██║   ██║██╔══██╗    ██║     ██║██║     ██║╚══██╔══╝██║  ██║',
--     '█████╗  ██║   ██║███████║    ██║     ██║██║     ██║   ██║   ███████║',
--     '██╔══╝  ╚██╗ ██╔╝██╔══██║    ██║     ██║██║     ██║   ██║   ██╔══██║',
--     '███████╗ ╚████╔╝ ██║  ██║    ███████╗██║███████╗██║   ██║   ██║  ██║',
--     '╚══════╝  ╚═══╝  ╚═╝  ╚═╝    ╚══════╝╚═╝╚══════╝╚═╝   ╚═╝   ╚═╝  ╚═╝',
--     '',
--     '                           [  辩机 ]     ',
-- }


-- vim.g.dashboard_custom_header = {
--    '               ▄▄██████████▄▄             ',
--    '               ▀▀▀   ██   ▀▀▀             ',
--    '       ▄██▄   ▄▄████████████▄▄   ▄██▄     ',
--    '     ▄███▀  ▄████▀▀▀    ▀▀▀████▄  ▀███▄   ',
--    '    ████▄ ▄███▀              ▀███▄ ▄████  ',
--    '   ███▀█████▀▄████▄      ▄████▄▀█████▀███ ',
--    '   ██▀  ███▀ ██████      ██████ ▀███  ▀██ ',
--    '    ▀  ▄██▀  ▀████▀  ▄▄  ▀████▀  ▀██▄  ▀  ',
--    '       ███           ▀▀           ███     ',
--    '       ██████████████████████████████     ',
--    '   ▄█  ▀██  ███   ██    ██   ███  ██▀  █▄ ',
--    '   ███  ███ ███   ██    ██   ███▄███  ███ ',
--    '   ▀██▄████████   ██    ██   ████████▄██▀ ',
--    '    ▀███▀ ▀████   ██    ██   ████▀ ▀███▀  ',
--    '     ▀███▄  ▀███████    ███████▀  ▄███▀   ',
--    '       ▀███    ▀▀██████████▀▀▀   ███▀     ',
--    '         ▀    ▄▄▄    ██    ▄▄▄    ▀       ',
--    '               ▀████████████▀             ',
--    '',
--    '                  [  辩机 ]     ',
-- }
