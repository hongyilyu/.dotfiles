return {
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "onsails/lspkind.nvim",
    config = require "plugins.configs.ui.lspkind",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = require "plugins.configs.ui.nvim-autopairs",
  },
  {
    "lewis6991/gitsigns.nvim",
    enabled = vim.fn.executable "git" == 1,
    ft = "gitcommit",
    event = "User LHY_GitFile",
    config = require "plugins.configs.ui.gitsigns",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User LHY_File",
    config = require "plugins.configs.ui.indent-blankline",
  },
  {
    "goolord/alpha-nvim",
    cmd = "Alpha",
    config = require "plugins.configs.ui.alpha",
  },
  { "akinsho/bufferline.nvim", config = require "plugins.configs.ui.bufferline" },
  { "kyazdani42/nvim-tree.lua", cmd = "NvimTreeToggle", config = require "plugins.configs.ui.nvim-tree" },
}
