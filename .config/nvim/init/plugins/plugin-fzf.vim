"
" fzf.vim
"
let $FZF_DEFAULT_COMMAND =  "rg --hidden -l ''"

" let g:height = float2nr(&lines * 0.9)
" let g:width = float2nr(&columns * 0.95)
" let g:preview_width = float2nr(&columns * 0.7)
" let g:fzf_buffers_jump = 1
" let $FZF_DEFAULT_OPTS=" --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4 --preview 'if file -i {}|grep -q binary; then file -b {}; else bat --style=changes --color always --line-range :40 {}; fi' --preview-window right:" . g:preview_width
" let g:fzf_layout = { 'window': 'call FloatingFZF(' . g:width . ',' . g:height . ')' }
"
" function! FloatingFZF(width, height)
"   let buf = nvim_create_buf(v:false, v:true)
"   call setbufvar(buf, '&signcolumn', 'no')
"
"   let height = float2nr(a:height)
"   let width = float2nr(a:width)
"   let horizontal = float2nr((&columns - width) / 2)
"   let vertical = 1
"
"   let opts = {
" 		\ 'relative': 'editor',
" 		\ 'row': vertical,
" 		\ 'col': horizontal,
" 		\ 'width': width,
" 		\ 'height': height,
" 		\ 'style': 'minimal'
" 		\ }
"
"   call nvim_open_win(buf, v:true, opts)
" endfunction

let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
	let buf = nvim_create_buf(v:false, v:true)
	call setbufvar(buf, '&signcolumn', 'no')

	let height = float2nr(10)
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

	call nvim_open_win(buf, v:true, opts)
endfunction


nnoremap <silent> <C-p> :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
