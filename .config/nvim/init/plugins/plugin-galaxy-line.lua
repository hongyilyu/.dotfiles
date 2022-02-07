-- require'nvim-web-devicons'.setup()

local gl = require "galaxyline"
local condition = require "galaxyline.condition"
local fileinfo = require "galaxyline.providers.fileinfo"
local lspclient = require "galaxyline.providers.lsp"
local u = require("util").u
local gls = gl.section
gl.short_line_list = { "NvimTree", "vista" }

local all_trim = function(s)
    return s:match "^%s*(.-)%s*$"
end

local Set = function(list)
    local set = {}
    for _, l in ipairs(list) do
        set[l] = true
    end
    return set
end

local ignore_file_name = Set { "NvimTree", "__vista__" }

local sep = {
    right_filled = u "e0b2",
    left_filled = u "e0b0",
    right = u "e0b3",
    left = u "e0b1",
}

local colors = {
    bg = "#282c34",
    yellow = "#fabd2f",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#608B4E",
    orange = "#FF8800",
    purple = "#5d4d7a",
    magenta = "#d16d9e",
    grey = "#c0c0c0",
    blue = "#569CD6",
    red = "#D16969",
}

local mode = {
    n = { name = "NORMAL", fg = colors.grey, bg = colors.purple },
    i = { name = "INSERT", fg = colors.grey, bg = colors.green },
    v = { name = "VISUAL", fg = colors.grey, bg = colors.blue },
    [""] = { name = "V-BLOCK", fg = colors.grey, bg = colors.blue },
    V = { name = "V-LINE", fg = colors.grey, bg = colors.blue },
    c = { name = "COMMAND", fg = colors.grey, bg = colors.purple },
    no = { name = "OP PENDING", fg = colors.grey, bg = colors.magenta },
    s = { name = "SELECT", fg = colors.grey, bg = colors.orange },
    S = { name = "S-LINE", fg = colors.grey, bg = colors.orange },
    [""] = { name = "S-BLOCK", fg = colors.grey, bg = colors.orange },
    ic = { name = "INSERT COMPL", fg = colors.grey, bg = colors.yellow },
    R = { name = "REPLACE", fg = colors.grey, bg = colors.red },
    Rv = { name = "V REPLACE", fg = colors.grey, bg = colors.red },
    t = { name = "TERMINAL", fg = colors.grey, bg = colors.red },
}

local mode_color = {
    n = colors.purple,
    i = colors.green,
    v = colors.blue,
    [""] = colors.blue,
    V = colors.blue,
    c = colors.purple,
    no = colors.magenta,
    s = colors.orange,
    S = colors.orange,
    [""] = colors.orange,
    ic = colors.yellow,
    R = colors.red,
    Rv = colors.red,
    cv = colors.red,
    ce = colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ["r?"] = colors.cyan,
    ["!"] = colors.red,
    t = colors.red,
}

local mode_name = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    [""] = "V-BLOCK",
    V = "V-LINE",
    c = "COMMAND",
    no = "OP PENDING",
    s = "SELECT",
    S = "S-LINE",
    [""] = "S-BLOCK",
    ic = "INSERT COMPL",
    R = "REPLACE",
    Rv = "V REPLACE",
    t = "TERMINAL",
}

local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand "%:t") ~= 1 then
        return true
    end
    return false
end

local buffer_name_not_in_short_line = function()
    if ignore_file_name[all_trim(fileinfo.get_current_file_name())] then
        return false
    end
    return buffer_not_empty()
end

gls.left[2] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            vim.api.nvim_command(
                "hi GalaxyViMode guibg=" .. mode[vim.fn.mode()].bg .. " guifg=" .. mode[vim.fn.mode()].fg .. " gui=bold"
            )
            vim.api.nvim_command(
                "hi GalaxyViModeInv guifg=" .. mode[vim.fn.mode()].bg .. " guibg=" .. colors.bg .. " gui=bold"
            )
            vim.api.nvim_command(
                "hi GalaxyViModeSep guibg=" .. mode[vim.fn.mode()].bg .. " guifg=" .. colors.bg -- .. " gui=bold"
            )
            vim.api.nvim_command(
                "hi GalaxyTextMode guifg=" .. colors.grey .. " guibg=" .. colors.bg -- .. " gui=bold"
            )
            -- auto change mode display according the vim mode
            return "  " .. mode[vim.fn.mode()].name .. " "
        end,
        separator = sep.left_filled .. " ",
        separator_highlight = "GalaxyViModeInv",
        highlight = "GalaxyViMode",
    },
}

gls.left[3] = {
    GitIcon = {
        provider = function()
            return "  "
        end,
        condition = condition.check_git_workspace,
        highlight = "GalaxyTextMode",
    },
}
gls.left[4] = {
    GitBranch = {
        provider = "GitBranch",
        condition = condition.check_git_workspace,
        separator = " " .. sep.left .. " ",
        separator_highlight = "GalaxyViModeInv",
        highlight = "GalaxyTextMode",
    },
}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

gls.left[5] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = " ",
        highlight = { colors.green, colors.bg },
    },
}
gls.left[6] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "~",
        highlight = { colors.blue, colors.bg },
    },
}
gls.left[7] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = " ",
        highlight = { colors.red, colors.bg },
        separator = sep.left,
        separator_highlight = "GalaxyViModeInv",
    },
}

local FilePath = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return vim.fn.expand "%"
    end
    return vim.fn.pathshorten(vim.fn.expand "%")
end

gls.left[9] = {
    FileName = {
        provider = FilePath,
        condition = buffer_not_empty,
        highlight = { colors.grey, colors.bg },
    },
}

gls.right[1] = {
    LSP = {
        provider = "GetLspClient",
        condition = function()
            return next(vim.lsp.buf_get_clients(0)) ~= nil
        end,
        icon = "  ",
        highlight = { colors.blue, colors.bg, "bold" },
    },
}
gls.right[3] = {
    DiagnosticError = {
        provider = function()
            local n = #vim.diagnostic.get(vim.api.nvim_get_current_buf(), { severity = vim.diagnostic.severity.ERROR })
            return string.format(" %s %d ", u "e009", n)
        end,
        condition = function()
            return next(vim.lsp.buf_get_clients(0)) ~= nil
        end,
        highlight = { colors.red, colors.bg },
    },
}

gls.right[4] = {
    DiagnosticWarn = {
        provider = function()
            local n = #vim.diagnostic.get(vim.api.nvim_get_current_buf(), { severity = vim.diagnostic.severity.WARN })
            return string.format(" %s %d ", u "f071", n)
        end,
        condition = function()
            return next(vim.lsp.buf_get_clients(0)) ~= nil
        end,
        highlight = { colors.orange, colors.bg },
    },
}

gls.right[5] = {
    FileFormat = {
        provider = "FileFormat",
        condition = checkwidth,
        separator = " " .. sep.right .. "  ",
        separator_highlight = "GalaxyViModeInv",
        highlight = { colors.grey, colors.bg, "bold" },
    },
}

gls.right[7] = {
    LineInfo = {
        provider = {
            function()
                return string.format(" %s:%s", vim.fn.line ".", vim.fn.col ".")
            end,
        },
        separator = sep.right_filled .. " ",
        separator_highlight = "GalaxyViModeInv",
        highlight = "GalaxyViMode",
        condition = checkwidth,
    },
}

gls.right[8] = {
    PerCent = {
        provider = "LinePercent",
        separator = sep.right .. " ",
        separator_highlight = "GalaxyViModeSep",
        highlight = "GalaxyViMode",
        condition = checkwidth,
    },
}

gls.short_line_left[1] = {
    BufferType = {
        provider = "FileTypeName",
        separator = " ",
        separator_highlight = { colors.purple, colors.bg },
        highlight = { colors.grey, colors.purple },
    },
}
gls.short_line_left[9] = {
    FileName = {
        provider = "FileName",
        condition = buffer_name_not_in_short_line,
        highlight = { colors.grey, colors.bg },
    },
}
