if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'

" 将 vim-init 目录加入 runtimepath
exec 'set rtp+='.s:home

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=~/.vim



" Load Basic Config
LoadScript init/init-basic.vim

" Load Extra Config
LoadScript init/init-config.vim

" Load Tabsize Config
LoadScript init/init-tabsize.vim

" Load Plugin Config
LoadScript init/init-plugins.vim

" Load UI Style Config
LoadScript init/init-style.vim

" Load Keymaps Config
LoadScript init/init-keymaps.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
colorscheme solarized
set background=dark
let g:solarized_termtrans=1
if has('gui_running')
	set background=light
else
	set background=dark
endif

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
	autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.rs,*.cpp,*.vim :call CleanExtraSpaces()
endif
