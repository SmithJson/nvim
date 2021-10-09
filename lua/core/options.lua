--[[
Author      : zhanglei103
Date        : 2021-09-26 01:15:22
LastEditors : zhanglei103
LastEditTime: 2021-09-26 01:15:22
Description : Vim Setting
--]]
local global = require("core.global")

local function bind_option(options)
    for k, v in pairs(options) do
        if type(v) == "boolean" then
            vim.cmd("set " .. k)
        else
            vim.cmd("set " .. k .. "=" .. v)
        end
    end
end

local function load_options()
    local global_local = {
        -- General
        termguicolors  = true,
        mouse          = "nv",
        report         = 0,
        errorbells     = true,
        visualbell     = true,
        hidden         = true,
        fileformats    = "unix,dos,mac",
        magic          = true,
        virtualedit    = "block",
        encoding       = "utf-8",
        viewoptions    = "folds,cursor,curdir,slash,unix",
        sessionoptions = "curdir,help,tabpages,winsize,buffers",

        -- Wildmenu
        wildmenu       = true,
        wildignorecase = true,
        wildignore     = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",

        -- Backup & Swap & Undo
        backup      = false,
        writebackup = false,
        swapfile    = false,
        undofile    = true,
        directory   = global.cache_dir .. "swap/",
        undodir     = global.cache_dir .. "undo/",
        backupdir   = global.cache_dir .. "backup/",
        viewdir     = global.cache_dir .. "view/",

        -- History saving
        history = 2000,
        shada   = "!,'300,<50,@100,s10,h",

        -- Disable swap/undo/viminfo/shada files in temp directories or shm
        backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",

        -- Tabs and Indents
        textwidth   = 120,
        expandtab   = true,
        tabstop     = 4,
        shiftwidth  = 4,
        softtabstop = -1,
        smarttab    = true,
        autoindent  = true,
        shiftround  = true,

        -- Timing
        timeout     = true,
        ttimeout    = true,
        timeoutlen  = 500,
        ttimeoutlen = 10,
        updatetime  = 100,
        redrawtime  = 1500,

        -- Behavior
        autoread     = true,
        wrap         = false,
        linebreak    = true,
        breakat      = [[\ \	;:,!?]],
        whichwrap    = "h,l,<,>,[,],~",
        splitbelow   = true,
        splitright   = true,
        switchbuf    = "useopen,vsplit",
        backspace    = "indent,eol,start",
        diffopt      = "filler,iwhite,internal,algorithm:patience",
        completeopt  = "menuone,noselect,noinsert",
        complete     = ".,w,b,k",
        autochdir    = true,
        confirm      = true,
        lazyredraw   = true,
        ttyfast      = true,
        regexpengine = 1,
        inde         = "",
        jumpoptions  = "stack",
        inccommand   = "nosplit",

        -- Searching
        ignorecase = true,
        smartcase  = true,
        infercase  = false,
        incsearch  = true,
        wrapscan   = true,
        hlsearch   = true,
        grepformat = "%f:%l:%c:%m",
        grepprg    = "ag --hidden --vimgrep --smart-case --",

        -- Editor UI
        number         = true,
        relativenumber = true,
        showmode       = false,
        ruler          = false,
        shortmess      = "aFc",
        scrolloff      = 2,
        list           = true,
        listchars      = "tab:»·,nbsp:+,trail:.,extends:→,precedes:←",
        showtabline    = 2,
        winwidth       = 30,
        winminwidth    = 10,
        pumheight      = 15,
        helpheight     = 12,
        previewheight  = 12,
        showcmd        = true,
        cmdheight      = 2,
        cmdwinheight   = 5,
        equalalways    = false,
        laststatus     = 2,
        display        = "lastline",
        showbreak      = "↳  ",
        pumblend       = 10,
        winblend       = 10
    }

    local bw_local = {
        synmaxcol      = 2500,
        formatoptions  = "1jcroql",
        readonly       = false,
        breakindentopt = "shift:2,min:20",
        foldenable     = true,
        foldmethod     = "indent",
        foldlevelstart = 99,
        signcolumn     = "yes",
        conceallevel   = 0,
        concealcursor  = "niv"
    }

    if global.is_mac then
        vim.g.clipboard = {
            name = "macOS-clipboard",
            copy = {
                ["+"] = "pbcopy",
                ["*"] = "pbcopy",
            },
            paste = {
                ["+"] = "pbpaste",
                ["*"] = "pbpaste",
            },
            cache_enabled = 0
        }
        vim.g.python3_host_prog = '/usr/local/bin/python3'
    end

    for name, value in pairs(global_local) do
         vim.o[name] = value
    end
    bind_option(bw_local)
end

load_options()
