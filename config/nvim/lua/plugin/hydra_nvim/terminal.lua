local Hydra = require "hydra"
local cmd = require("hydra.keymap-util").cmd

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
