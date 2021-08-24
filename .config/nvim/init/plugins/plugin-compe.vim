lua <<EOF
require'compe'.setup {
  enabled = true;

  autocomplete = true;
  debug = false;
  documentation = true;
  incomplete_delay = 400;

  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  min_length = 1;

  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;

  source = {
    path = true;
    buffer = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
  };
}
EOF
inoremap <silent><expr> <CR>      compe#confirm()('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

