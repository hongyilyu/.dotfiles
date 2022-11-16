local nnoremap = require("util").nnoremap

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

-- Goto buffer in position...
nnoremap("<leader>1", "<cmd>BufferLineGoToBuffer1<CR>")
nnoremap("<leader>2", "<cmd>BufferLineGoToBuffer2<CR>")
nnoremap("<leader>3", "<cmd>BufferLineGoToBuffer3<CR>")
nnoremap("<leader>4", "<cmd>BufferLineGoToBuffer4<CR>")
nnoremap("<leader>5", "<cmd>BufferLineGoToBuffer5<CR>")
nnoremap("<leader>6", "<cmd>BufferLineGoToBuffer6<CR>")
nnoremap("<leader>7", "<cmd>BufferLineGoToBuffer7<CR>")
nnoremap("<leader>8", "<cmd>BufferLineGoToBuffer8<CR>")
nnoremap("<leader>9", "<cmd>BufferLineGoToBuffer9<CR>")
