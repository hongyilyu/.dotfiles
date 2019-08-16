let mapleader = ','
let g:mapleader = ','



"----------------------------------------------------------------------
" Basic Config
"----------------------------------------------------------------------

set nocompatible        " disable vi mode compatible
set bs=eol,start,indent " set backspace key mode
set whichwrap+=<,>,h,l
set nohlsearch

set autoindent          " auto indentation
set cindent             " C/C++ indentation
set wrap                " display long lines as multiple line
set breakindent         " enable indentation
" ident by an additional 4 characters on wrapped lines, when line >= 10 characters, put 'showbreak' at start of line
set breakindentopt=shift:4,sbr,min:10
set showbreak=↪         "wrap indent
set smartindent         " Smart Indent
set ttimeout            " Function Key timeout
set ttimeoutlen=50      " Function Key timeout set to 50 ms
set ruler               " always show current position
set number              " show line number
set relativenumber      " turn hybrid line number on
						" toggle it check below

" Vim paste copy to OS clipboard
set clipboard+=unnamed

"----------------------------------------------------------------------
" Encoding Config
"----------------------------------------------------------------------
if has('multi_byte')
	" 内部工作编码
	set encoding=utf-8
	" 文件默认编码
	set fileencoding=utf-8
	" 打开文件时自动尝试下面顺序的编码
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

"----------------------------------------------------------------------
" Indentation Config
"----------------------------------------------------------------------
if has('autocmd')
	" Check file type indent for different file, allow plugin
	filetype plugin indent on
endif

"----------------------------------------------------------------------
" Syntax Highlighting
"----------------------------------------------------------------------
if has('syntax')
	syntax enable
	syntax on
endif

"----------------------------------------------------------------------
" 其他设置
"----------------------------------------------------------------------
set showmatch           " cursor shows matching ) and }
set matchtime=3         " how many tens of second to blink when matching bracket
set display=lastline    " Show last line

set wildmenu                " wild char completion menu
set wildignore=*.o,*~,*.pyc " ignore compiled files
set wildmode=list:longest
set completeopt=longest,menu " auto complete like normal IDE
set magic                   " for regular expressions turn magic on

set title               " change terminal's title
set autoread            " auto reload file
set showcmd             " show command on status bar
set scrolloff=15        " keep 15 lines when scrol down or up
set cursorline          " highlight current line
set mousehide           " hide the mouse when typing
"set mouse=a            " not sure what it does, https://gist.github.com/u0d7i/01f78999feff1e2a8361
set hid                 " A buffer becomes hidden when it is abandoned
" 延迟绘制（提升性能）

set lazyredraw

" 错误格式
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

" 设置分隔符可视
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<


" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tags

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m

" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 文件换行符，默认使用 unix 换行符
set ffs=unix,dos,mac


"----------------------------------------------------------------------
" Foldenable Config
"----------------------------------------------------------------------
if has('folding')
	set foldenable          " code folding
	set foldmethod=indent   " fold depend on indent
	set foldlevel=99        " fold level
endif

"----------------------------------------------------------------------
" Ignore extension when searching or auto-completion
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
