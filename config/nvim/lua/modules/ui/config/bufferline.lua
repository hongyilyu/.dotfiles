local nnoremap = require("core.util").nnoremap

require("bufferline").setup {
    options = {
        numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        tab_size = 21,
        diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc" | false,
        diagnostics_update_in_insert = false,
        offsets = {
            { filetype = "NvimTree", text = "File Explorer", padding = 1 },
            { filetype = "Outline", text = "Symbol Outline", padding = 1 },
        },
        separator_style = "thick", -- | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true,
        always_show_bufferline = true,

        groups = {
            options = {
                toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
            },
            items = {
                {
                    name = "Tests", -- Mandatory
                    highlight = { underline = true, sp = "blue" }, -- Optional
                    priority = 2, -- determines where it will appear relative to other groups (Optional)
                    icon = "", -- Optional
                    matcher = function(buf) -- Mandatory
                        return buf.filename:match "%_test" or buf.filename:match "%_spec"
                    end,
                    separator = { -- Optional
                        style = require("bufferline.groups").separator.tab,
                    },
                },
            },
        },
    },
}
