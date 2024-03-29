return {
    options = {
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
      numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
      max_name_length = 30,
      max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
      tab_size = 21,
      diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc" | false,
      diagnostics_update_in_insert = false,
      offsets = {
        { filetype = "NvimTree", text = "File Explorer", padding = 1 , highlight = "Directory", text_align = "left"},
      },
      separator_style = "thick", -- | "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = true,
      always_show_bufferline = true,
    },
}
