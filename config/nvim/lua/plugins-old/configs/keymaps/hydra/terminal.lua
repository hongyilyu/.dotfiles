local Hydra = require "hydra"
local cmd = require("hydra.keymap-util").cmd
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

local hint = [[
        Terminals
████████  _b_  BTM
   ██     _g_  GitUI
   ██     _f_  Float Term
   ██     _h_  Bottom Term
   ██     _v_  Right Term
          _t_  Tab Terminal
                    _<Esc>_
]]

Hydra {
    name = "Terminals",
    hint = hint,
    config = {
        color = "teal",
        invoke_on_body = true,
        hint = {
            position = "middle",
            border = "rounded",
        },
    },
    mode = "n",
    body = "<Leader>t",
    heads = {
        { "b", cmd "lua _BTM_TOGGLE()" },
        { "g", cmd "lua _GITUI_TOGGLE()" },
        { "f", cmd "ToggleTerm direction=float" },
        { "h", cmd "ToggleTerm size=10 direction=horizontal" },
        { "v", cmd "ToggleTerm size=80 direction=vertical" },
        { "t", cmd "ToggleTerm direction=tab" },
        { "<Esc>", nil, { exit = true, nowait = true } },
    },
}
