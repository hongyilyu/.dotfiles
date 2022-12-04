local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_nvim.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself

    -- GUI Enhancements
    use "sainnhe/gruvbox-material"
    use "kyazdani42/nvim-web-devicons"
    use "easymotion/vim-easymotion"
    use "psliwka/vim-smoothie"
    use "lukas-reineke/indent-blankline.nvim"
    use "nvim-lualine/lualine.nvim"
    use "akinsho/bufferline.nvim"
    use "rcarriga/nvim-notify"
    use "kyazdani42/nvim-tree.lua"
    use "goolord/alpha-nvim"
    use "RRethy/vim-illuminate"
    use "akinsho/toggleterm.nvim"
    use "chrisbra/Colorizer"
    use "chaoren/vim-wordmotion"

    -- TreeSitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "nvim-treesitter/nvim-treesitter-context"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "p00f/nvim-ts-rainbow"

    -- LSP bridge
    use "jose-elias-alvarez/null-ls.nvim"
    use "jayp0521/mason-null-ls.nvim"

    -- LSP
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-cmp"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use {
        "j-hui/fidget.nvim", -- lsp status
        config = function()
            require("fidget").setup()
        end,
    }

    -- Rust
    use { "simrat39/rust-tools.nvim" }
    use {
        "saecki/crates.nvim",
        tag = "v0.3.0",
        config = function()
            require("crates").setup {
                null_ls = {
                    enabled = true,
                    name = "crates.nvim",
                },
            }
        end,
    }

    -- Telescope
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-ui-select.nvim"
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use "AckslD/nvim-neoclip.lua"
    use "ahmedkhalf/project.nvim"

    -- CheatSheet
    use "lewis6991/gitsigns.nvim"
    use "windwp/nvim-autopairs"
    use "tpope/vim-commentary"
    use "folke/which-key.nvim"
    use "anuvyklack/hydra.nvim"
end)
