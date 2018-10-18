call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'valloric/youcompleteme'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'wakatime/vim-wakatime'

call plug#end()



" leader key
let mapleader = ','
let g:mapleader = ','

set encoding=utf-8
set history=2000 	" set history upper limit

filetype on      	" check file type
filetype indent on      " indent for different file
filetype plugin on	" allow plugin

set title	    	" change terminal's title
set autoread    	" auto reload file
set showmatch 		" cursor shows matching ) and }
set matchtime=3	    " how many tens of second to blink when matching bracket
set showmode 		" show current mode
set ruler			" always show current position
set number			" show line number
set showcmd			" show command on status bar
set scrolloff=7		" keep 7 lines when scrol down or up
set nowrap			" display long lines as just one line

set autoindent		" auto indentation
set copyindent		" copy previous indentation on autoindenting
"set hlsearch 		" search highlighting
"set incsearch		" make search acts like in browsers
"set ignorecase		" ignore case when searching
"set smartcase		" case sensitive when more than one capitalize
set smarttab		" insert tabs on the start of line based on context
set cursorcolumn	" highlight current column
set cursorline		" highlight current line
set mousehide		" hide the mouse when typing

set tabstop=4		" tab key width
set shiftwidth=4	" indent width
set softtabstop=4	" insert tabs on the start of line based on shiftwidth
set	smarttab		" tab to space
set expandtab

set novisualbell	" disable sound on error
set noerrorbells	" disable sound on error
set t_vb=		" disable sound on error
set tm=500		" ?

set foldenable		" code folding
set foldmethod=indent	" fold depend on indent
set foldlevel=99	" fold level
" code folding function at around line 80

set wildmenu		" wild char completion menu
set wildignore=*.o,*~,*.pyc " ignore compiled files
set wildmode=list:longest
set completeopt=longest,menu " auto complete like normal IDE
set magic		" for regular expressions turn magic on

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" More natural split
set splitright
set splitbelow

" More natural split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Easymotion
"
map <Leader>f <Plug>(easymotion-bd-f)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1

"
" Airline
"
let g:airline_theme='molokai'
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
" Use patched fonts
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" enable/disable fugitive/lawrencium integration
let g:airline#extensions#branch#enabled = 1
" enable/disable showing a summary of changed hunks under source control.
let g:airline#extensions#hunks#enabled = 1
" enable/disable showing only non-zero hunks.
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#whitespace#enabled = 0
" ctrlp with airline
let g:airline#extension#ctrlp#enabled=1
" Tab navigation
nnoremap <S-tab> :bnext<CR>
nmap <leader>1 :bfirst<CR>
nmap <leader>2 :bfirst<CR>:bn<CR>
nmap <leader>3 :bfirst<CR>:2bn<CR>
nmap <leader>4 :bfirst<CR>:3bn<CR>
" fix ui bug
autocmd BufWritePost $MYVIMRC source $MYVIMRC | AirlineRefresh | AirlineRefresh


"
" CtrlP
"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" ancestor is .git and current dir
let g:ctrlp_working_path_mode = 'ra'
" MacOS or Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = 'find %s -type f'

"
" NerdTree
"
map <C-n> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" change default arrow
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'

"
" Ale
" https://www.zhihu.com/question/47691414/answer/373700711
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 100
let g:ale_echo_delay = 20
let g:ale_lint_delay = 100
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_cursor_detail = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {'cpp': ['clang']}
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'

let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

" 
" UndoTree
"
nnoremap <F5> :UndotreeToggle<cr>
" relative timestamp
if !exists('g:undotree_RelativeTimestamp')
    let g:undotree_RelativeTimestamp = 1
endif
" Highlight changed text
if !exists('g:undotree_HighlightChangedText')
    let g:undotree_HighlightChangedText = 1
endif
" tree node shape.
if !exists('g:undotree_TreeNodeShape')
    let g:undotree_TreeNodeShape = '*'
endif
if !exists('g:undotree_DiffCommand')
    let g:undotree_DiffCommand = "diff"
endif
" if set, let undotree window get focus after being opened, otherwise
" focus will stay in current window.
if !exists('g:undotree_SetFocusWhenToggle')
    let g:undotree_SetFocusWhenToggle = 1
endif

" 
" YouCompleteMe
"
set completeopt-=preview

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0

nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme solarized
set background=dark
set t_Co=256
let g:solarized_termtrans=1
if has('gui_running')
    set background=light
else
    set background=dark
endif

"let g:solarized_termcolors=256



" code folding shortcuts <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun
