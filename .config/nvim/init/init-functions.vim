""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle auto relative number
"augroup numbertoggle
	"autocmd!
	"autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	"autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

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

