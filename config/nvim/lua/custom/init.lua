require("custom.reverse")
require("custom.comment")

-- this needs to be initialized after everything
vim.g.smoothie_experimental_mappings = true

vim.cmd([[
set wildcharm=<C-z>
cnoremap <expr> <Tab>   getcmdtype() =~ '[\/?]' ? "<C-g>" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() =~ '[\/?]' ? "<C-t>" : "<S-Tab>"
]])
