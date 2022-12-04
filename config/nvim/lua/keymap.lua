local nnoremap = require("util").nnoremap
local inoremap = require("util").inoremap
local vnoremap = require("util").vnoremap
local cnoremap = require("util").cnoremap

-- ----------------------------------------------------------------------
--  INSERT mode default EMAC key mapping
-- ----------------------------------------------------------------------
inoremap("<c-a>", "<home>")
inoremap("<c-e>", "<end>")

inoremap("<C-n>", "<down>")
inoremap("<C-p>", "<up>")
inoremap("<C-f>", "<right>")
inoremap("<C-b>", "<left>")

-- ----------------------------------------------------------------------
--  use CTRL+HJKL to move cursor
--  check：http://www.skywind.me/blog/archives/2021
-- ----------------------------------------------------------------------
inoremap("<C-j>", "<down>")
inoremap("<C-k>", "<up>")
inoremap("<C-l>", "<right>")
inoremap("<C-h>", "<left>")

-- ----------------------------------------------------------------------
--  cmd line mode easy navigation
-- ----------------------------------------------------------------------
cnoremap("<c-h>", "<left>")
cnoremap("<c-j>", "<down>")
cnoremap("<c-k>", "<up>")
cnoremap("<c-l>", "<right>")
cnoremap("<c-a>", "<home>")
cnoremap("<c-e>", "<end>")
cnoremap("<c-f>", "<c-d>")
cnoremap("<c-b>", "<left>")
cnoremap("<c-d>", "<del>")
cnoremap("<c-_>", "<c-k>")

-- Use alt + hjkl to resize windows
nnoremap("<M-j>", ":resize -2<CR>")
nnoremap("<M-k>", ":resize +2<CR>")
nnoremap("<M-h>", ":vertical resize -2<CR>")
nnoremap("<M-l>", ":vertical resize +2<CR>")

-- Move by line for vim wrap
vim.cmd [[
map H ^
map L $
]]

-- Keep search in the center
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")

-- Undo break points
inoremap(",", ",<c-g>u")
inoremap(".", ".<c-g>u")
inoremap("!", "!<c-g>u")
inoremap("?", "?<c-g>u")
inoremap("[", "[<c-g>u")
inoremap("'", "'<c-g>u")
inoremap("\"", "\"<c-g>u")

-- Open new file adjacent to current file
nnoremap("<leader>e", ":e <C-R>=expand('%:p:h') . '/' <CR>")

-- Easymotion
vim.cmd [[
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
]]

-- Nvim-Tree
nnoremap("<C-n>", ":NvimTreeFindFileToggle<CR>")

-- Comentary
nnoremap("<leader>/", "<cmd>lua require('plugin.comment')()<CR>")
vnoremap("<leader>/", "<cmd>lua require('plugin.comment')()<CR>")

-- Document highlights
nnoremap("<M-n>", "<cmd>lua require\"illuminate\".next_reference{wrap=true}<cr>")
nnoremap("<M-p>", "<cmd>lua require\"illuminate\".next_reference{reverse=true,wrap=true}<cr>")
