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
    local stdout, ret = Job:new({
        command = command,
        args = cmd,
        cwd = cwd,
        on_stderr = function(_, data)
            table.insert(stderr, data)
        end,
    }):sync()
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

function M.Set(list)
    local set = {}
    for _, l in ipairs(list) do
        set[l] = true
    end
    return set
end

-- colors
M.colors = {
    -- Palette 1
    bg0 = "#1d2021",
    bg1 = "#282828",
    bg2 = "#282828",
    bg3 = "#3c3836",
    bg4 = "#3c3836",
    -- Reference from vscode {{
    bg5 = "#46403d",
    bg6 = "#504945",
    bg7 = "#514945",
    bg8 = "#5a524c",
    bg9 = "#665c54",
    --}}
    bg_statusline1 = "#282828",
    bg_statusline2 = "#32302f",
    bg_statusline3 = "#504945",
    bg_diff_green = "#32361a",
    bg_visual_green = "#333e34",
    bg_diff_red = "#3c1f1e",
    bg_visual_red = "#442e2d",
    bg_diff_blue = "#0d3138",
    bg_visual_blue = "#2e3b3b",
    bg_visual_yellow = "#473c29",
    bg_current_word = "#32302f",

    -- Palette 2
    fg0 = "#d4be98",
    fg1 = "#ddc7a1",
    red = "#ea6962",
    orange = "#e78a4e",
    yellow = "#d8a657",
    green = "#a9b665",
    aqua = "#89b482",
    blue = "#7daea3",
    purple = "#d3869b",
    bg_red = "#ea6962",
    bg_green = "#a9b665",
    bg_yellow = "#d8a657",

    -- Palette 3
    grey0 = "#7c6f64",
    grey1 = "#928374",
    grey2 = "#a89984",
    none = "NONE",
    shadow = "#00000070",
}

return M
