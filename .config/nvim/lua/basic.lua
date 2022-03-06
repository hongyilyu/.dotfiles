vim.cmd [[
let mapleader = ','
let g:mapleader = ','



"----------------------------------------------------------------------
" Basic Config
"----------------------------------------------------------------------

set nocompatible        " disable vi mode compatible
set bs=eol,start,indent " set backspace key mode set whichwrap+=<,>		" https://vim.fandom.com/wiki/Automatically_wrap_left_and_right
set nohlsearch

set autoindent          " auto indentation
set cindent             " C/C++ indentation
set wrap                " display long lines as multiple line
set breakindent         " enable indentation
" ident by an additional 4 characters on wrapped lines, when line >= 10 characters, put 'showbreak' at start of line
set breakindentopt=shift:4,sbr,min:10
set showbreak=↪         " wrap indent
set smartindent         " Smart Indent
set ttimeout            " Function Key timeout
set ttimeoutlen=50      " Function Key timeout set to 50 ms
set ruler               " always show current position
"set number              " show line number
"set relativenumber      " turn hybrid line number on
set clipboard+=unnamed  " Vim paste copy to OS clipboard
set lazyredraw

set undodir=~/.vimdid   " Permanent undo
set undofile

"----------------------------------------------------------------------
" Indent Format
"----------------------------------------------------------------------
set tabstop=4           " tab key width
set shiftwidth=4        " indent width
set softtabstop=4       " insert tabs on the start of line based on shiftwidth
set expandtab           " Always uses spaces instead of tab characters (et)
" set noet                " set no expandable tab

"----------------------------------------------------------------------
" File Type Different
"----------------------------------------------------------------------
autocmd FileType html,css,typescript,javascript,yaml,json,jsonc setlocal shiftwidth=2 tabstop=2 expandtab
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc


"----------------------------------------------------------------------
" Other Settings
"----------------------------------------------------------------------
set showmatch           " cursor shows matching ) and }
set matchtime=3         " how many tens of second to blink when matching bracket
set display=lastline    " Show last line

set wildmenu                " wild char completion menu
set wildignore=*.o,*~,*.pyc " ignore compiled files
set wildmode=list:longest
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set magic                   " for regular expressions turn magic on

set title               " change terminal's title
set autoread            " auto reload file
set showcmd             " show command on status bar
set scrolloff=15        " keep 15 lines when scrol down or up
set nocursorline        " highlight current line
set mousehide           " hide the mouse when typing
set hid                 " A buffer becomes hidden when it is abandoned
" set mouse=a				" Enable mouse usage in terminals

" error format
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

" display hidden/invisible characters
set invlist
" set list
" set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

" if text object Unicode > 255，wrap line before space.
set formatoptions+=m

" default unix line-break
set ffs=unix,dos,mac

"----------------------------------------------------------------------
" Display Settings
"----------------------------------------------------------------------

set laststatus=2

" default new window at right side when split
set splitright
set splitbelow

" open file at location that was last viewed
if has("autocmd")
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \     exe "normal! g`\"" |
        \ endif
endif

]]
