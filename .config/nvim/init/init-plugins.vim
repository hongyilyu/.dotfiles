call plug#begin('~/.vim/plugged')

" VIM Enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug 'pechorin/any-jump.vim'

" GUI Enhancements
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'romgrk/barbar.nvim'
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'psliwka/vim-smoothie'
Plug 'liuchengxu/vista.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'voldikss/vim-floaterm'
" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Fuzzy Finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" Doc
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rhysd/rust-doc.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ColorScheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd ColorScheme gruvbox-material highlight clear SignColumn
autocmd ColorScheme gruvbox-material highlight SignifySignAdd    ctermbg=None guifg=green
autocmd ColorScheme gruvbox-material highlight SignifySignDelete ctermbg=None guifg=red
autocmd ColorScheme gruvbox-material highlight SignifySignChange ctermbg=None guifg=yellow
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

" NerdCommenter
let g:NERDSpaceDelims = 1

" LSP
LoadScript init/plugins/plugin-coc.vim

" Easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1

" fzf.vim
LoadScript init/plugins/plugin-fzf.vim

" luafile ~/.dotfiles/.config/nvim/init/plugins/plugin-tree-sitter.lua
luafile ~/.dotfiles/.config/nvim/init/plugins/plugin-galaxy-line.lua
luafile ~/.dotfiles/.config/nvim/init/plugins/plugin-telescope.lua
LoadScript init/plugins/plugin-floaterm.vim
LoadScript init/plugins/plugin-barbar.vim
LoadScript init/plugins/plugin-denite.vim
LoadScript init/plugins/plugin-nvim-tree.vim
LoadScript init/plugins/plugin-which-key.vim
LoadScript init/plugins/plugin-vista.vim
