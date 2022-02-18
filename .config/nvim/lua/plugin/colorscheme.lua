vim.cmd[[
autocmd ColorScheme gruvbox-material highlight clear SignColumn
autocmd ColorScheme gruvbox-material highlight GitSignsAdd    ctermbg=None guifg=green
autocmd ColorScheme gruvbox-material highlight GitSignsDelete ctermbg=None guifg=red
autocmd ColorScheme gruvbox-material highlight GitSignsChange ctermbg=None guifg=yellow
if has('termguicolors')
    set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
set signcolumn=yes:2
]]
