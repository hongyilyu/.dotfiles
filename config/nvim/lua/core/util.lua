-- Source: https://github.com/simrat39/dotfiles/blob/master/nvim/.config/nvim/lua/mappings.lua
local M = {}

function M.Set(list)
    local set = {}
    for _, l in ipairs(list) do
        set[l] = true
    end
    return set
end

function M.nnoremap(lhs, rhs, silent)
    if not silent then
        silent = true
    end
    vim.keymap.set("n", lhs, rhs, { noremap = true, silent = silent })
end

function M.inoremap(lhs, rhs)
    vim.keymap.set("i", lhs, rhs, { noremap = true })
end

function M.vnoremap(lhs, rhs, silent)
    if not silent then
        silent = true
    end
    vim.keymap.set("v", lhs, rhs, { noremap = true, silent = silent })
end

function M.cnoremap(lhs, rhs)
    vim.keymap.set("c", lhs, rhs, { noremap = true })
end

return M
