call plug#begin('~/.vim/plugged')

" VIM Enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'

" GUI Enhancements
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mkitt/tabline.vim'
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim' " <leader>gm
Plug 'sainnhe/gruvbox-material'
Plug 'psliwka/vim-smoothie'
" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sbdchd/neoformat'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Fuzzy Finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neovim/nvim-lsp'
" Plug 'tjdevries/lsp_extensions.nvim'
" Plug 'nvim-lua/completion-nvim'
" Plug 'nvim-lua/diagnostic-nvim'
" Plug 'sbdchd/neoformat'

" Other
Plug 'wakatime/vim-wakatime'

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

" AutoPairs
let g:AutoPairsMapCh = 0

" LSP
" LoadScript init/plugins/plugin-lsp.vim
LoadScript init/plugins/plugin-coc.vim

" Easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1

" Airline
LoadScript init/plugins/plugin-airline.vim

" fzf.vim
LoadScript init/plugins/plugin-fzf.vim

