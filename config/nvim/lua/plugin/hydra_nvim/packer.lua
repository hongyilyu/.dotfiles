local Hydra = require "hydra"
local cmd = require("hydra.keymap-util").cmd

local hint = [[
  ^ ^        Packer
  ^
  _c_  Compile
  _i_  Install
  _s_  Sync
  _S_  Status
  _u_  Update
  ^
       ^^^^                _<Esc>_
]]

Hydra {
    name = "Packer",
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
    body = "<Leader>p",
    heads = {
        { "c", cmd "PackerCompile" },
        { "i", cmd "PackerInstall" },
        { "s", cmd "PackerSync" },
        { "S", cmd "PackerStatus" },
        { "u", cmd "PackerUpdate" },
        { "<Esc>", nil, { exit = true, nowait = true } },
    },
}
