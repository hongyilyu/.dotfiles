local config = {}

function config.treesitter()
    require("nvim-treesitter.configs").setup {
        ensure_installed = { "rust", "vim", "typescript", "toml", "tsx", "yaml", "json", "http", "markdown_inline" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        ignore_install = {}, -- List of parsers to ignore installing
        autopairs = { enable = true },
        highlight = {
            enable = true, -- false will disable the whole extension
            use_languagetree = true,
            disable = {}, -- list of language that will be disabled
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
        context_commentstring = { enable = true },
        rainbow = {
            enable = true,
            -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
        },
    }
end

function config.ts_context()
    require("treesitter-context").setup()
end

return config
