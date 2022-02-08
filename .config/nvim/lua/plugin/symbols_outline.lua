vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = 'right',
    relative_width = true,
    width = 35,
    auto_close = true,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = false,
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-K>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
    },
}

require("util").nnoremap("<leader>s", "<cmd>SymbolsOutline<CR>")
