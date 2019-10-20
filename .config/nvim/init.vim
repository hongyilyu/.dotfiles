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

" Load Functions Config
LoadScript init/init-functions.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme ephemanord
