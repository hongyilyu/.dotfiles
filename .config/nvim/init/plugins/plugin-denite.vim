" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> o
  \ denite#do_map('do_action')

  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> f
  \ denite#do_map('open_filter_buffer')

  nnoremap <silent><buffer><expr> s
  \ denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> a
  \ denite#do_map('toggle_select').'j'
endfunction

" Rust
let g:rust_doc#downloaded_rust_doc_dir = '~/Rust/rust-docs'
let g:rust_doc#define_map_K = 0
augroup vimrc-rust
    autocmd!
    autocmd FileType rust nnoremap <buffer> <silent> <leader>d :<C-u>DeniteCursorWord rust/doc<CR>
augroup END
