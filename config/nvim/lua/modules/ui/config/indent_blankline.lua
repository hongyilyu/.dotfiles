require("indent_blankline").setup {
    buftype_exclude = { "terminal" },
    filetype_exclude = { "alpha", "lspinfo", "packer", "lsp-installer", "null-ls-info", "lazy" },

    use_treesitter = true,
    show_end_of_line = false,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = false,
}
