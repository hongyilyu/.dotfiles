-- Credit: https://github.com/nguyenvukhang/nvim-toggler/blob/v0.1.0/lua/nvim-toggler.lua
local nnoremap = require("core.util").nnoremap
local vnoremap = require("core.util").vnoremap

local t = vim.tbl_add_reverse_lookup {
    ["true"] = "false",
    ["yes"] = "no",
    ["on"] = "off",
    ["left"] = "right",
    ["up"] = "down",
}

local c = {
    ["n"] = "norm! ciw",
    ["v"] = "norm! c",
}

local reverse = function()
    local i = vim.tbl_get(t, vim.fn.expand "<cword>")
    xpcall(function()
        vim.cmd(vim.tbl_get(c, vim.api.nvim_get_mode().mode) .. i)
    end, function()
        print "reverse: unsupported value."
    end)
end

nnoremap("<leader>r", reverse, true)
vnoremap("<leader>r", reverse, true)
