""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Easy documentation for vim which key
let g:which_key_map = {}

function! Desc(key, desc)
	let path = split(a:key, '\.')
	let length = len(path)
	let i = 0
	let ref = g:which_key_map
	for v in path
		if i == length - 1
			if a:desc[0] == '+'
				if !has_key(ref, v)
					let ref[v] = { 'name': a:desc }
				else
					let ref[v].name = a:desc
				endif
			else
				let ref[v] = a:desc
			endif
		else
			if !has_key(ref, v)
				let ref[v] = {}
			endif
			let ref = ref[v]
		endif
		let i += 1
	endfor
endfunction

function! DescIgnore(key)
	call Desc(a:key, 'which_key_ignore')
endfunction
