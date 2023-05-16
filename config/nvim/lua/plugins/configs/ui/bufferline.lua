return function(_, opts)
  require("bufferline").setup {
    options = {
      numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
      max_name_length = 30,
      max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
      tab_size = 21,
      diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc" | false,
      diagnostics_update_in_insert = false,
      offsets = {
        { filetype = "neo-tree", text = "File Explorer", padding = 1 },
      },
      separator_style = "thick", -- | "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = true,
      always_show_bufferline = true,
    },
  }

  local ignore_mappings = {
    ["1"] = { "<cmd>lua require('bufferline').go_to_buffer(1, true)<CR>", "which_key_ignore" },
    ["2"] = { "<cmd>lua require('bufferline').go_to_buffer(2, true)<CR>", "which_key_ignore" },
    ["3"] = { "<cmd>lua require('bufferline').go_to_buffer(3, true)<CR>", "which_key_ignore" },
    ["4"] = { "<cmd>lua require('bufferline').go_to_buffer(4, true)<CR>", "which_key_ignore" },
    ["5"] = { "<cmd>lua require('bufferline').go_to_buffer(5, true)<CR>", "which_key_ignore" },
    ["6"] = { "<cmd>lua require('bufferline').go_to_buffer(6, true)<CR>", "which_key_ignore" },
    ["7"] = { "<cmd>lua require('bufferline').go_to_buffer(7, true)<CR>", "which_key_ignore" },
    ["8"] = { "<cmd>lua require('bufferline').go_to_buffer(8, true)<CR>", "which_key_ignore" },
    ["9"] = { "<cmd>lua require('bufferline').go_to_buffer(9, true)<CR>", "which_key_ignore" },
  }
  local wk_opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }
  require "which-key".register(ignore_mappings, wk_opts)
end
