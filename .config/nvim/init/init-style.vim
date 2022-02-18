"----------------------------------------------------------------------
" Display Settings
"----------------------------------------------------------------------

set laststatus=2

" show command at bottom left
set showcmd

" display leading spaces
set listchars=lead:⋅

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
