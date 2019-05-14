let mapleader = ','
let g:mapleader = ','

set encoding=utf-8
set history=2000        " set history upper limit

filetype on             " check file type
filetype indent on      " indent for different file
filetype plugin on      " allow plugin

set title               " change terminal's title
set autoread            " auto reload file
set showmatch           " cursor shows matching ) and }
set matchtime=3         " how many tens of second to blink when matching bracket
set ruler               " always show current position
set number              " show line number
set relativenumber      " turn hybrid line number on
                        " toggle it check below
set showcmd             " show command on status bar
set scrolloff=15        " keep 15 lines when scrol down or up
set wrap                " display long lines as multiple line
set breakindent         " enable indentation
" ident by an additional 4 characters on wrapped lines, when line >= 10 characters, put 'showbreak' at start of line
set breakindentopt=shift:4,sbr,min:10
set showbreak=↪       "wrap indent

set autoindent          " auto indentation
set smartindent         " Smart Indent
set copyindent          " copy previous indentation on autoindenting
"set hlsearch           " search highlighting
"set incsearch          " make search acts like in browsers
"set ignorecase         " ignore case when searching
"set smartcase          " case sensitive when more than one capitalize
set smarttab            " insert tabs on the start of line based on context
"set cursorcolumn        " highlight current column
set cursorline          " highlight current line
set mousehide           " hide the mouse when typing
set mouse-=a            " not sure what it does, https://gist.github.com/u0d7i/01f78999feff1e2a8361

set tabstop=4           " tab key width
set shiftwidth=4        " indent width
set softtabstop=4       " insert tabs on the start of line based on shiftwidth
set smarttab            " tab to space
set expandtab

set hid                 " A buffer becomes hidden when it is abandoned
set mat=2               " How many tenths of a second to blink when matching brackets

set novisualbell        " disable sound on error
set noerrorbells        " disable sound on error
set t_vb=               " disable sound on error
set tm=500              " ?

set foldenable          " code folding
set foldmethod=indent   " fold depend on indent
set foldlevel=99        " fold level
"set foldcolumn=1        " Add a bit extra margin to the left

" code folding function at functions.vim

set wildmenu                " wild char completion menu
set wildignore=*.o,*~,*.pyc " ignore compiled files
set wildmode=list:longest
set completeopt=longest,menu " auto complete like normal IDE
set magic                   " for regular expressions turn magic on

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

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif




source $VIM_CONFIG/plugins.vim
source $VIM_CONFIG/color.vim
source $VIM_CONFIG/functions.vim
