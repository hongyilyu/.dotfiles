"
" Airline
"
let g:airline_theme='gruvbox_material'
let g:airline_section_z = '%P %l/%L%{g:airline_symbols.maxlinenr} : %v'
" Use patched fonts
let g:airline_powerline_fonts = 0
" enable/disable fugitive/lawrencium integration
let g:airline#extensions#branch#enabled = 1
" enable/disable showing a summary of changed hunks under source control.
let g:airline#extensions#hunks#enabled = 1
" enable/disable showing only non-zero hunks.
let g:airline#extensions#hunks#non_zero_only = 1
set ttimeoutlen=10

let g:airline#extensions#coc#enabled = 1
" tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#buffer_idx_format = {
		\ '0': '⓪  ',
		\ '1': '①  ',
		\ '2': '②  ',
		\ '3': '③  ',
		\ '4': '④  ',
		\ '5': '⑤  ',
		\ '6': '⑥  ',
		\ '7': '⑦  ',
		\ '8': '⑧  ',
		\ '9': '⑨  '
		\}

" Tab navigation
nnoremap <S-tab> :bnext<CR>
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
call DescIgnore('1')
call DescIgnore('2')
call DescIgnore('3')
call DescIgnore('4')
call DescIgnore('5')
call DescIgnore('6')
call DescIgnore('7')
call DescIgnore('8')
call DescIgnore('9')
" fix ui bug
command! AirlineForceRefresh call airline#load_theme() | call airline#update_statusline() | call airline#load_theme() | call airline#update_statusline()

function! RefreshUI()
	if exists(':AirlineRefresh')
		AirlineRefresh
	else
		" Clear & redraw the screen, then redraw all statuslines.
		redraw!
		redrawstatus!
	endif
endfunction

