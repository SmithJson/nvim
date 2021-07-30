vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c", "cpp", "go", "gomod", "rust", "bash", "lua", "toml", "yaml","java","php",
        "typescript", "tsx", "vue", "scss", "jsdoc","dart", "comment", "javascript", "json"
    },
    ignore_install = {
        "beancount", "bibtex", "c_sharp", "clojure",
        "commonlisp", "cuda", "devicetree", "elixir",
        "erlang", "fennel", "Godot", "glimmer", "graphql",
        "julia", "kotlin", "ledger", "nix", "ocaml", "ocaml_interface",
         "ql", "query", "r", "rst", "ruby", "sparql",
        "supercollider", "svelte", "teal", "turtle",
        "verilog", "zig"
    },
    highlight = {enable = true, disable = {'vim'}},
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
            }
        }
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = 1 * 1000, -- Do not enable for files with more than 1000 lines, int
    }
}
