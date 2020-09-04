"
" fzf.vim
"
let $FZF_DEFAULT_COMMAND =  "rg --colors 'match:bg:yellow' --colors 'match:fg:black' --colors 'match:style:nobold' --colors 'path:fg:green' --colors 'path:style:bold' --colors 'line:fg:yellow' --colors 'line:style:bold' --hidden -l ''"

let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
	" border parameter
	let height = float2nr(15)
	let width = float2nr(80)
	let horizontal = float2nr((&columns - width) / 2)
	let vertical = 1
	let opts = {
		\ 'relative': 'editor',
		\ 'row': vertical,
		\ 'col': horizontal,
		\ 'width': width,
		\ 'height': height,
		\ 'style': 'minimal'
		\ }

	" border style
	let top = "╭" . repeat("─", width - 2) . "╮"
	let mid = "│" . repeat(" ", width - 2) . "│"
	let bot = "╰" . repeat("─", width - 2) . "╯"
	let lines = [top] + repeat([mid], height - 2) + [bot]

	" create border
	let s:buf = nvim_create_buf(v:false, v:true)
	call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
	call nvim_open_win(s:buf, v:true, opts)

	" set window parameter
	set winhl=Normal:Floating
	let opts.row += 1
	let opts.height -= 2
	let opts.col += 2
	let opts.width -= 4

	call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
	au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \       "rg --hidden -l ''".shellescape(<q-args>), 0,
      \       {'options': '--reverse --prompt "."'},
      \       <bang>0)

nnoremap <silent> <C-p> :call fzf#run(fzf#wrap({'options': '--reverse --prompt "."'}))<CR>

nnoremap <silent> <C-x> :Rg<CR>
