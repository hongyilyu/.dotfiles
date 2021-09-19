call plug#begin('~/.vim/plugged')

" GUI Enhancements
Plug 'sainnhe/gruvbox-material'
Plug 'easymotion/vim-easymotion'
Plug 'psliwka/vim-smoothie'
Plug 'glepnir/galaxyline.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" LSP
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'kabouzeid/nvim-lspinstall'

" Autocomplete
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'simrat39/rust-tools.nvim'
Plug 'sbdchd/neoformat'

" Telescope
Plug 'airblade/vim-rooter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'simrat39/symbols-outline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'terrortylor/nvim-comment'
Plug 'kevinhwang91/nvim-bqf'
Plug 'folke/which-key.nvim'
Plug 'kyazdani42/nvim-tree.lua', {'on': ['NvimTreeToggle'], 'do': 'LoadScript init/plugins/plugin-nvim-tree.vim'}

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

" fzf.vim
LoadScript init/plugins/plugin-fzf.vim
LoadScript init/plugins/plugin-lspconfig.vim
LoadScript init/plugins/plugin-compe.vim
LoadScript init/plugins/plugin-barbar.vim
LoadScript init/plugins/plugin-symbol-outline.vim
LoadLua init/plugins/plugin-galaxy-line.lua
LoadLua init/plugins/plugin-gitsigns.lua
LoadLua init/plugins/plugin-telescope.lua
LoadLua init/plugins/plugin-lspsaga.lua
LoadLua init/plugins/plugin-lsp-install.lua
LoadLua init/plugins/plugin-treesitter.lua
LoadLua init/plugins/plugin-autopairs.lua

" LoadScript init/plugins/plugin-floaterm.vim
" LoadScript init/plugins/plugin-denite.vim
" LoadScript init/plugins/plugin-which-key.vim
" LoadScript init/plugins/plugin-vista.vim
