-- Source: https://github.com/whatsthatsmell/dots/blob/master/public%20dots/vim-nvim/lua/joel/utils.lua

local Job = require "plenary.job"

local M = {}

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand "%:t") == 1
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

-- Source: 🔭 utils: https://git.io/JK3ht
function M.get_os_command_output(cmd, cwd)
    if type(cmd) ~= "table" then
        print "Utils: [get_os_command_output]: cmd has to be a table"
        return {}
    end
    local command = table.remove(cmd, 1)
    local stderr = {}
    local stdout, ret = Job
        :new({
            command = command,
            args = cmd,
            cwd = cwd,
            on_stderr = function(_, data)
                table.insert(stderr, data)
            end,
        })
        :sync()
    return stdout, ret, stderr
end

-- Source: https://github.com/kraftwerk28/dotfiles/blob/2d7cd79b9a6483ba26c859ac2dbbc2d422e619ed/.config/nvim/lua/utils.lua
function M.u(code)
    if type(code) == "string" then
        code = tonumber("0x" .. code)
    end
    local c = string.char
    if code <= 0x7f then
        return c(code)
    end
    local t = {}
    if code <= 0x07ff then
        t[1] = c(bit.bor(0xc0, bit.rshift(code, 6)))
        t[2] = c(bit.bor(0x80, bit.band(code, 0x3f)))
    elseif code <= 0xffff then
        t[1] = c(bit.bor(0xe0, bit.rshift(code, 12)))
        t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
        t[3] = c(bit.bor(0x80, bit.band(code, 0x3f)))
    else
        t[1] = c(bit.bor(0xf0, bit.rshift(code, 18)))
        t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 12), 0x3f)))
        t[3] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
        t[4] = c(bit.bor(0x80, bit.band(code, 0x3f)))
    end
    return table.concat(t)
end


-- Source: https://github.com/simrat39/dotfiles/blob/master/nvim/.config/nvim/lua/mappings.lua
function M.nnoremap(lhs, rhs, silent)
    if not silent then
        silent = true
    end
    vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = silent })
end

function M.inoremap(lhs, rhs)
    vim.api.nvim_set_keymap("i", lhs, rhs, { noremap = true })
end

function M.vnoremap(lhs, rhs)
    vim.api.nvim_set_keymap("v", lhs, rhs, { noremap = true })
end

function M.cnoremap(lhs, rhs)
    vim.api.nvim_set_keymap("c", lhs, rhs, { noremap = true })
end




return M


