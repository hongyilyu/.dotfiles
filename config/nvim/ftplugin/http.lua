local nnoremap = require("util").nnoremap
local opts = require("plugin.whichkey")

require "plugin.rest_nvim"
nnoremap("<Plug>RestNvim", ":lua require('rest-nvim').run()<CR>")
nnoremap("<Plug>RestNvimPreview", ":lua require('rest-nvim').run(true)<CR>")
nnoremap("<Plug>RestNvimLast", ":lua require('rest-nvim').last()<CR>")

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end


local mappings = {
    r = {
        name = "RestNvim",
        n = {"<cmd>lua require('rest-nvim').run()<CR>", "Run URI"},
        p = {"<cmd>lua require('rest-nvim').run(true)<CR>", "Run Preview"},
        l = {"<cmd>lua require('rest-nvim').last()<CR>", "Run last"},
    }
}

which_key.register(mappings, opts)
