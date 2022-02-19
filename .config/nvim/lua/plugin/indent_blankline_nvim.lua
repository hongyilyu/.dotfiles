vim.opt.list = true

require("indent_blankline").setup {
    buftype_exclude = { "terminal" },
    filetype_exclude = { "alpha", "lspinfo" },

    use_treesitter = true,
    show_end_of_line = false,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = false,
}