return {
  {
    "f4z3r/gruvbox-material.nvim",
    opts = {
      contrast = "hard",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
  { "catppuccin", enabled = false },
  { "tokyonight.nvim", enabled = false },
  {
    "psliwka/vim-smoothie",
    init = function()
      vim.g.smoothie_experimental_mappings = true
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "tab",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = function()
      return {
        options = {
          numbers = "ordinal",
          separator_style = "thick",
          enforce_regular_tabs = true,
          always_show_bufferline = true,
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              padding = 1,
              highlight = "Directory",
              text_align = "left",
            },
          },
        },
      }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", false },
    },
  },
}
