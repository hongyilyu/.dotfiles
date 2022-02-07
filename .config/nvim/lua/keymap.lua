local nnoremap = require("util").nnoremap
local inoremap = require("util").inoremap
local vnoremap = require("util").vnoremap

-- Use alt + hjkl to resize windows
nnoremap("<M-j>", ":resize -2<CR>")
nnoremap("<M-k>", ":resize +2<CR>")
nnoremap("<M-h>", ":vertical resize -2<CR>")
nnoremap("<M-l>", ":vertical resize +2<CR>")

-- Nvim-Tree
nnoremap("<C-n>", ":NvimTreeToggle<CR>")

-- Comentary
nnoremap("<space>/", '<cmd>lua require("plugin.comment")()<CR>')
vnoremap("<space>/", '<cmd>lua require("plugin.comment")()<CR>')

local wk = require "which-key"

wk.register {}
