"----------------------------------------------------------------------
" Indent Format
"----------------------------------------------------------------------
set tabstop=4           " tab key width
set shiftwidth=4        " indent width
set softtabstop=4       " insert tabs on the start of line based on shiftwidth
set smarttab            " tab to space
set noet                " set no expandable tab


"----------------------------------------------------------------------
" File Type Different
"----------------------------------------------------------------------
autocmd FileType html,css,typescript,javascript,yaml setlocal shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
