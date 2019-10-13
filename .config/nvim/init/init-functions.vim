""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle auto relative number
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

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

" Floating Window
nnoremap <c-c> :call OpenFloatingWin()<CR>
function! TerminalCreate() abort
	if !has('nvim')
		return v:false
	endif

	if !exists('g:terminal')
		let g:terminal = {
					\ 'opts': {},
					\ 'term': {
					\ 'loaded': v:null,
					\ 'bufferid': v:null
					\ },
					\ 'origin': {
					\ 'bufferid': v:null
					\ }
					\ }

		function! g:terminal.opts.on_exit(jobid, data, event) abort
			silent execute 'buffer' g:terminal.origin.bufferid
			silent execute 'bdelete!' g:terminal.term.bufferid

			let g:terminal.term.loaded = v:null
			let g:terminal.term.bufferid = v:null
			let g:terminal.origin.bufferid = v:null
		endfunction
	endif

	if g:terminal.term.loaded
		return v:false
	endif

	let g:terminal.origin.bufferid = bufnr('')

	enew
	call termopen(&shell, g:terminal.opts)

	let g:terminal.term.loaded = v:true
	let g:terminal.term.bufferid = bufnr('')
	startinsert
endfunction
function! TerminalToggle()
	if !has('nvim')
		return v:false
	endif

	" Create the terminal buffer.
	if !exists('g:terminal') || !g:terminal.term.loaded
		return TerminalCreate()
	endif

	" Go back to origin buffer if current buffer is terminal.
	if g:terminal.term.bufferid ==# bufnr('')
		silent execute 'buffer' g:terminal.origin.bufferid

		" Launch terminal buffer and start insert mode.
	else
		let g:terminal.origin.bufferid = bufnr('')

		silent execute 'buffer' g:terminal.term.bufferid
		startinsert
	endif
endfunction

function! OpenFloatingWin()
	let height = &lines - 3
	let width = float2nr(&columns - (&columns * 2 / 10))
	let col = float2nr((&columns - width) / 2)

	let opts = {
		\ 'relative': 'editor',
		\ 'row': height * 0.3,
		\ 'col': col + 30,
		\ 'width': width * 2 / 3,
		\ 'height': height / 2
		\ }

	let buf = nvim_create_buf(v:false, v:true)
	let win = nvim_open_win(buf, v:true, opts)

	call setwinvar(win, '&winhl', 'Normal:Pmenu')

	setlocal
		\ buftype=nofile
		\ nobuflisted
		\ bufhidden=hide
		\ nonumber
		\ norelativenumber
		\ signcolumn=no
	call TerminalToggle()
endfunction
