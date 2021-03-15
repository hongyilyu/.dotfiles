nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual ','<CR>
set timeoutlen=500

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0
let g:which_key_display_names = { ' ': 'SPC', '<C-H>': 'BS', '<C-I>': 'TAB', '<TAB>': 'TAB', }

call Desc('gm', 'Git Commit Message')
call DescIgnore('g.m')
call DescIgnore(',') " ignore easy motion
" Coc
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                                        , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                              , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'                            , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'                   , 'selected action'],
      \ 'c' : [':CocCommand tsserver.goToProjectConfig'            , 'project config'],
      \ 'd' : [':CocFzfList diagnostics'                           , 'diagnostics'],
      \ 'e' : [':CocCommand explorer --sources=file+ --width 45'   , 'explorer'],
      \ 'f' : ['<Plug>(coc-format-selected)'                       , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                                , 'format'],
      \ 'q' : ['<Plug>(coc-fix-current)'                           , 'quick fix'],
      \ 'r' : ['<Plug>(coc-rename)'                                , 'rename'],
      \ 'R' : ['<Plug>(coc-references)'                            , 'references'],
      \ 's' : [':CocList -I symbols'                               , 'symbols'],
      \ 'S' : [':CocFzfList snippets'                              , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'                       , 'type definition'],
      \ 'U' : [':CocUpdate'                                        , 'update CoC'],
      \ 'v' : [':Vista!!'                                          , 'tag viewer'],
      \ 'y' : [':CocFzfList yank'                                  , 'yanks'],
      \ }

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

autocmd! User vim-which-key call which_key#register(',', 'g:which_key_map')
