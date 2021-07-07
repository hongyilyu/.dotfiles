local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init {
  git = { clone_timeout = 300 },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

return require("packer").startup(function(use)
  -- Packer can manage itself as an optional plugin
  use "wbthomason/packer.nvim"
  use {
    "sainnhe/gruvbox-material",
    config = [[require 'lhy-gruvbox']],
  }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "windwp/nvim-ts-autotag"

  -- lsp
  use "neovim/nvim-lspconfig"
  use "glepnir/lspsaga.nvim"
  use { "kabouzeid/nvim-lspinstall", opt = true, event = "BufRead" }

  -- Autocomplete
  use { "hrsh7th/nvim-compe", config = [[require('config.compe')]] }
  use "hrsh7th/vim-vsnip"
  use "sbdchd/neoformat"

  -- Telescope
  use "airblade/vim-rooter"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-fzy-native.nvim"

  -- Status Line and Bufferline
  use "kyazdani42/nvim-web-devicons"
  use "glepnir/galaxyline.nvim"
  use "romgrk/barbar.nvim"

  -- MISC
  use "simrat39/symbols-outline.nvim"
  use { "lewis6991/gitsigns.nvim", config = [[require 'config.gitsigns']] }
  use { "windwp/nvim-autopairs", config = [[require 'config.autopairs']] }
  use { "terrortylor/nvim-comment", config = [[require 'config.comment']] }
  use "kevinhwang91/nvim-bqf"
  use { "folke/which-key.nvim", config = [[require 'config.which-key']] }
  use { "kyazdani42/nvim-tree.lua", config = [[require 'config.nvim-tree']] }
  use {
    "numToStr/FTerm.nvim",
    event = "BufWinEnter",
    config = function()
      require("config.floatterm").config()
    end,
  }
end)
