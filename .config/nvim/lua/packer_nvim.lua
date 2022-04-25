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
    -- Switch to hop when incremental search is implemented! https://github.com/phaazon/hop.nvim/issues/52
    -- use { "phaazon/hop.nvim",
    --     branch = 'v1', -- optional but strongly recommended
    --     config = function()
    --         -- you can configure hop the way you like here; see :h hop-config
    --         require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    --     end }
    use "psliwka/vim-smoothie"
    use "lukas-reineke/indent-blankline.nvim"
    use "nvim-lualine/lualine.nvim"
    use "akinsho/bufferline.nvim"
    use "rcarriga/nvim-notify"
    use "kyazdani42/nvim-tree.lua"
    use "goolord/alpha-nvim"
    use "RRethy/vim-illuminate"
    use "akinsho/toggleterm.nvim"

    -- TreeSitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "p00f/nvim-ts-rainbow"

    -- LSP bridge
    use "jose-elias-alvarez/null-ls.nvim"
    use "folke/trouble.nvim"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "hrsh7th/nvim-cmp"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "nvim-lua/lsp-status.nvim"

    -- Rust
    use { "simrat39/rust-tools.nvim" }
    use "mfussenegger/nvim-dap"
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use { "saecki/crates.nvim", tag = "v0.1.0" }

    -- Telescope
    use "airblade/vim-rooter"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use "dhruvmanila/telescope-bookmarks.nvim"
    use "tami5/sqlite.lua" -- because I'm Firefox ~
    use "AckslD/nvim-neoclip.lua"
    use "LinArcX/telescope-command-palette.nvim"
    use "ahmedkhalf/project.nvim"
    use { 'nvim-telescope/telescope-ui-select.nvim' }

    -- org mode
    use "nvim-neorg/neorg"
    use "nvim-neorg/neorg-telescope"

    -- CheatSheet
    use "lewis6991/gitsigns.nvim"
    use "windwp/nvim-autopairs"
    use "tpope/vim-commentary"
    --use "kevinhwang91/nvim-bqf"
    use "folke/which-key.nvim"

    -- Misc
    use "NTBBloodbath/rest.nvim"
end)
