return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      disable = { filetypes = { "TelescopePrompt" } },
    },
    config = require("plugins.configs.keymaps.whichkey.which-key"),
  },
  {
    "anuvyklack/hydra.nvim",
    event = "VeryLazy",
    config = require("plugins.configs.keymaps.hydra"),
  },
  {
    "akinsho/toggleterm.nvim",
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
}
