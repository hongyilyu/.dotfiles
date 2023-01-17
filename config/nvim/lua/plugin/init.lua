require "plugin.colorscheme"
require "plugin.cmp_nvim"
require "plugin.lsp"
require "plugin.comment"
require "plugin.telescope_nvim"
require "plugin.treesitter"
require "plugin.nvim_tree"
require "plugin.autopairs"
require "plugin.bufferline_nvim"
require "plugin.gitsigns_nvim"
require "plugin.lualine_nvim"
require "plugin.indent_blankline_nvim"
require "plugin.alpha_nvim"
require "plugin.toggleterm_nvim"
require "plugin.whichkey"
require "plugin.hydra_nvim"
require("treesitter-context").setup()

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

local nnoremap = require("util").nnoremap
local vnoremap = require("util").vnoremap

-- vim-smoothie
vim.g.smoothie_experimental_mappings = 1

-- Easymotion
vim.g.EasyMotion_smartcase = 1
vim.cmd [[
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
]]

-- Leap
require('leap').add_default_mappings()
vim.keymap.del({'x', 'o'}, 'x')
vim.keymap.del({'x', 'o'}, 'X')
vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })

-- Nvim-Tree
nnoremap("<C-n>", ":NvimTreeFindFileToggle<CR>")

-- Comentary
nnoremap("<leader>/", "<cmd>lua require('plugin.comment')()<CR>")
vnoremap("<leader>/", "<cmd>lua require('plugin.comment')()<CR>")

-- Document highlights
nnoremap("<M-n>", "<cmd>lua require\"illuminate\".next_reference{wrap=true}<cr>")
nnoremap("<M-p>", "<cmd>lua require\"illuminate\".next_reference{reverse=true,wrap=true}<cr>")
