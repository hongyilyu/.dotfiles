"
" fzf.vim
"
let $FZF_DEFAULT_COMMAND="fd --hidden --type f --exclude .git"
let $FZF_DEFAULT_OPTS="--reverse || --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null'"

let g:fzf_branch_actions = {
	\ 'track': {
	\   'prompt': 'Track> ',
	\   'execute': 'echo system("{git} checkout --track {branch}")',
	\   'multiple': v:false,
	\   'keymap': 'ctrl-t',
	\   'required': ['branch'],
	\   'confirm': v:false,
	\ },
	\ 'diff': {
	\   'prompt': 'Diff> ',
	\   'execute': 'Git diff {branch}',
	\   'multiple': v:false,
	\   'keymap': 'ctrl-f',
	\   'required': ['branch'],
	\   'confirm': v:false,
	\ },
	\}

 let g:fzf_colors = { 'fg':      ['fg', 'Comment'],
 	\ 'bg':         ['bg', 'Normal'],
 	\ 'hl':         ['fg', 'Statement'],
 	\ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
 	\ 'bg+':        ['bg', 'Normal'],
 	\ 'hl+':        ['fg', 'Statement'],
 	\ 'info':       ['fg', 'PreProc'],
 	\ 'border':     ['fg', 'Ignore'],
 	\ 'prompt':     ['fg', 'Conditional'],
 	\ 'pointer':    ['fg', 'Exception'],
 	\ 'marker':     ['fg', 'Keyword'],
 	\ 'spinner':    ['fg', 'Label'],
 	\ 'header':     ['fg', 'Comment'] }

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



nnoremap <silent> <C-p> :call fzf#run(fzf#wrap({'options': '--reverse --prompt "."'}))<CR>


" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
