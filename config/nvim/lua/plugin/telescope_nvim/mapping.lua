local nnoremap = require("util").nnoremap
local inoremap = require("util").inoremap
local vnoremap = require("util").vnoremap

nnoremap("<C-p>", '<cmd>lua require("plugin.telescope_nvim.finder").ctrl_p()<CR>')
