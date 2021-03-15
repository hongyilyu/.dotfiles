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

" s is for search powered by telescope
nnoremap <silent> <C-p> :Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '.' : [':Telescope filetypes'                   , 'filetypes'],
      \ ';' : [':Telescope commands'                    , 'commands'],
      \ 'a' : [':Telescope lsp_code_actions'            , 'code_actions'],
      \ 'A' : [':Telescope builtin'                     , 'all'],
      \ 'b' : [':Telescope buffers'                     , 'buffers'],
      \ 'B' : [':Telescope git_branches'                , 'git branches'],
      \ 'd' : [':Telescope lsp_document_diagnostics'    , 'document_diagnostics'],
      \ 'D' : [':Telescope lsp_workspace_diagnostics'   , 'workspace_diagnostics'],
      \ 'c' : [':Telescope git_commits'                 , 'git_commits'],
      \ 'C' : [':Telescope git_bcommits'                , 'git_bcommits'],
      \ 'f' : [':Telescope find_files find_command=rg,--ignore,--hidden,--files', 'files'],
      \ 'F' : [':Telescope git_files'                   , 'git_files'],
      \ 'g' : [':Telescope tags'                        , 'tags'],
      \ 'G' : [':Telescope current_buffer_tags'         , 'buffer_tags'],
      \ 'h' : [':Telescope command_history'             , 'history'],
      \ 'H' : [':Telescope help_tags'                   , 'help_tags'],
      \ 'i' : [':Telescope media_files'                 , 'media files'],
      \ 'k' : [':Telescope keymaps'                     , 'keymaps'],
      \ 'l' : [':Telescope loclist'                     , 'loclist'],
      \ 'm' : [':Telescope marks'                       , 'marks'],
      \ 'M' : [':Telescope man_pages'                   , 'man_pages'],
      \ 'o' : [':Telescope vim_options'                 , 'vim_options'],
      \ 'O' : [':Telescope oldfiles'                    , 'oldfiles'],
      \ 'p' : [':Telescope fd'                          , 'fd'],
      \ 'P' : [':Telescope spell_suggest'               , 'spell_suggest'],
      \ 's' : [':Telescope git_status'                  , 'git_status'],
      \ 'S' : [':Telescope grep_string'                 , 'grep_string'],
      \ 't' : [':Telescope live_grep'                   , 'text'],
      \ 'y' : [':Telescope symbols'                     , 'symbols'],
      \ 'Y' : [':Telescope lsp_workspace_symbols'       , 'lsp_workspace_symbols'],
      \ 'r' : [':Telescope registers'                   , 'registers'],
      \ 'R' : [':Telescope reloader'                    , 'reloader'],
      \ 'w' : [':Telescope file_browser'                , 'buf_fuz_find'],
      \ 'u' : [':Telescope colorscheme'                 , 'colorschemes'],
      \ 'z' : [':Telescope current_buffer_fuzzy_find'   , 'buf_fuz_find'],
      \ }

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=normal --height=6'       , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'm' : [':FloatermNew lazynpm'                           , 'npm'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 'u' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ }

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

autocmd! User vim-which-key call which_key#register(',', 'g:which_key_map')
