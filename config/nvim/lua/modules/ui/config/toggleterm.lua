local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "tab",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
}

local Terminal = require("toggleterm.terminal").Terminal
local gitui = Terminal:new { cmd = "gitui" }

function _GITUI_TOGGLE()
    gitui:toggle()
end

local btm = Terminal:new { cmd = "btm" }

function _BTM_TOGGLE()
    btm:toggle()
end

local cargo_test = Terminal:new { cmd = "cargo test" }

function _CARGO_TEST()
  cargo_test:toggle()
end