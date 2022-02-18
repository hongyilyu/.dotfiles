call plug#begin('~/.vim/plugged')

" GUI Enhancements
Plug 'sainnhe/gruvbox-material'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'psliwka/vim-smoothie'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'glepnir/dashboard-nvim'
Plug 'RRethy/vim-illuminate'

" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'p00f/nvim-ts-rainbow'

" LSP bridge
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'folke/trouble.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'nvim-lua/lsp-status.nvim'

" Rust
Plug 'simrat39/rust-tools.nvim', { 'commit': '7b4d155dd47e211ee661cbb4c7969b245f768edb'}
Plug 'mfussenegger/nvim-dap'
Plug 'saecki/crates.nvim', { 'tag': 'v0.1.0' }

" Telescope
Plug 'airblade/vim-rooter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'dhruvmanila/telescope-bookmarks.nvim'
Plug 'tami5/sqlite.lua' " because I'm Firefox ~
Plug 'AckslD/nvim-neoclip.lua'
Plug 'LinArcX/telescope-command-palette.nvim'

" CheatSheet
Plug 'simrat39/symbols-outline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-commentary'
Plug 'kevinhwang91/nvim-bqf'
Plug 'folke/which-key.nvim'
Plug 'chentau/marks.nvim'

" Misc
Plug 'NTBBloodbath/rest.nvim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ColorScheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd ColorScheme gruvbox-material highlight clear SignColumn
autocmd ColorScheme gruvbox-material highlight GitSignsAdd    ctermbg=None guifg=green
autocmd ColorScheme gruvbox-material highlight GitSignsDelete ctermbg=None guifg=red
autocmd ColorScheme gruvbox-material highlight GitSignsChange ctermbg=None guifg=yellow
if has('termguicolors')
    set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
set signcolumn=yes:2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-smoothie
let g:smoothie_experimental_mappings = 1

" Easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1

lua require("plugin")

" LoadLua init/plugins/plugin-galaxy-line.lua
LoadLua init/plugins/plugin-which-key.lua
