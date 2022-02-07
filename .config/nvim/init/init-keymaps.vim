"----------------------------------------------------------------------
" INSERT mode default EMAC key mapping
"----------------------------------------------------------------------
inoremap <c-a> <home>
inoremap <c-e> <end>

inoremap <C-n> <down>
inoremap <C-p> <up>
inoremap <C-f> <right>
inoremap <C-b> <left>

"----------------------------------------------------------------------
" use CTRL+HJKL to move cursor
" check：http://www.skywind.me/blog/archives/2021
"----------------------------------------------------------------------
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
inoremap <C-h> <left>

"----------------------------------------------------------------------
" cmd line mode easy navigation
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>

"----------------------------------------------------------------------
" MISC
"----------------------------------------------------------------------
" Move by line for vim wrap
nnoremap j gj
nnoremap k gk
map H ^
map L $

" Keep search in the center
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap [ [<c-g>u
inoremap ' '<c-g>u
inoremap " "<c-g>u

" Open new file adjacent to current file
nnoremap <leader>E :e <C-R>=expand("%:p:h") . "/" <CR>
call Desc('E', 'Open adjacent to current file')
