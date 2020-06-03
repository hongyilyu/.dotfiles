""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle auto relative number
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" 定义一个 DiffOrig 命令用于查看文件改动
nnoremap <leader>df :DiffOrig<CR>
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		\ | wincmd p | diffthis
endif

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

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	silent! %s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfun

if has("autocmd")
	autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.rs,*.cpp,*.vim,*.sql :call CleanExtraSpaces()
endif


nnoremap <c-c> :call FloatTerm()<CR>
" Floating Term
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
	" Configuration
	let height = float2nr((&lines - 2) * 0.6)
	let row = float2nr((&lines - height) / 2)
	let width = float2nr(&columns * 0.6)
	let col = float2nr((&columns - width) / 2)
	" Border Window
	let border_opts = {
		\ 'relative': 'editor',
		\ 'row': row - 1,
		\ 'col': col - 1,
		\ 'width': width + 2,
		\ 'height': height + 2,
		\ 'style': 'minimal'
		\ }
	let border_buf = nvim_create_buf(v:false, v:true)
	let s:float_term_border_win = nvim_open_win(border_buf, v:true, border_opts)
	" Terminal Window
	let opts = {
		\ 'relative': 'editor',
		\ 'row': row,
		\ 'col': col,
		\ 'width': width,
		\ 'height': height,
		\ 'style': 'minimal'
		\ }
	let buf = nvim_create_buf(v:false, v:true)
	let s:float_term_win = nvim_open_win(buf, v:true, opts)
	" Styling
	hi FloatTermNormal term=None ctermbg=0
	call setwinvar(s:float_term_border_win, '&winhl', 'Normal:FloatTermNormal')
	call setwinvar(s:float_term_win, '&winhl', 'Normal:FloatTermNormal')
	if a:0 == 0
		terminal
	else
		call termopen(a:1)
	endif
	set nonumber
	set norelativenumber
	set signcolumn=no
	startinsert
	" Close border window when terminal window close
	autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction
