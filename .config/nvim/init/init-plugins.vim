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
Plug 'morhetz/gruvbox'

" Fuzzy Finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" LSP
Plug 'neovim/nvim-lsp'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'

" Other
Plug 'wakatime/vim-wakatime'

call plug#end()

autocmd ColorScheme gruvbox highlight clear SignColumn
autocmd ColorScheme gruvbox highlight SignifySignAdd    ctermfg=green  ctermbg=234 guifg=#ebdbb2 guibg=#1d2021
autocmd ColorScheme gruvbox highlight SignifySignDelete ctermfg=red    ctermbg=234 guifg=#ebdbb2 guibg=#1d2021
autocmd ColorScheme gruvbox highlight SignifySignChange ctermfg=yellow ctermbg=234 guifg=#ebdbb2 guibg=#1d2021
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'
set signcolumn=yes:2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" AutoPairs
let g:AutoPairsMapCh = 0

" LSP
LoadScript init/plugins/plugin-lsp.vim

"
" NerdComment
" <leader> c <space>


" Easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1

" Airline
LoadScript init/plugins/plugin-airline.vim

" fzf.vim
LoadScript init/plugins/plugin-fzf.vim

