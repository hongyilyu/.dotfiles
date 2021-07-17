"----------------------------------------------------------------------
" Display Settings
"----------------------------------------------------------------------

set laststatus=2

" show command at bottom left
set showcmd

" default new window at right side when split
set splitright
set splitbelow

" open file at location that was last viewed
if has("autocmd")
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\	 exe "normal! g`\"" |
		\ endif
endif

" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
