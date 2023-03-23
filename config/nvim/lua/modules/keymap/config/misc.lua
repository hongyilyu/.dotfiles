local nnoremap = require("core.util").nnoremap

-- nnoremap("q:", "<Nop>")
vim.cmd [[ nnoremap q: <Nop> ]]

-- vim-smoothie
vim.g.smoothie_experimental_mappings = 1

-- Easymotion
vim.g.EasyMotion_smartcase = 1
vim.cmd [[
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
]]

-- Nvim-Tree
nnoremap("<C-n>", ":NvimTreeFindFileToggle<CR>")

-- Document highlights
nnoremap("<M-n>", "<cmd>lua require\"illuminate\".next_reference{wrap=true}<cr>")
nnoremap("<M-p>", "<cmd>lua require\"illuminate\".next_reference{reverse=true,wrap=true}<cr>")
