call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wakatime/vim-wakatime'
Plug 'mhinz/vim-signify'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'tpope/vim-surround'
Plug 'mkitt/tabline.vim'
Plug 'airblade/vim-rooter'
Plug 'liuchengxu/vista.vim'
Plug 'rhysd/git-messenger.vim'
if isdirectory('/usr/local/opt/fzf')
	Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
	Plug 'junegunn/fzf.vim'
endif

call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Vista
"
nnoremap <Leader>vc :Vista finder<CR>
nnoremap <Leader>vf :Vista!!<CR>
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:airline#extensions#vista#enabled=1
let g:vista_default_executive = 'coc'

"
" Easymotion
"
map <Leader>fd <Plug>(easymotion-bd-f)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1

" Airline
LoadScript init/plugins/plugin-airline.vim

" fzf.vim
LoadScript init/plugins/plugin-fzf.vim

" Coc
LoadScript init/plugins/plugin-coc.vim
