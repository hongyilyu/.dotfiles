local Hydra = require "hydra"
local cmd = require("hydra.keymap-util").cmd

local hint = [[
_a_: Code Action    _d_: Document Diagnostic    _i_: LSP Info
_r_: Rename         _w_: Workspace Diagnostic   _l_: CodeLens
_f_: Quickfix                                   _F_: Format
 ^
 ^ ^                _q_: exit                   _<ESC>_: exit
]]

Hydra {
    name = "LSP",
    hint = hint,
    config = {
        color = "pink",
        invoke_on_body = true,
        hint = {
            border = "rounded",
        },
    },
    mode = { "n" },
    body = "<leader>l",
    heads = {
        {
            "a",
            function()
                vim.lsp.buf.code_action()
            end,
            { expr = true, desc = "code actions" },
        },
        {
            "r",
            function()
                vim.lsp.buf.rename()
            end,
            { expr = true, desc = "rename variable" },
        },
        {
            "f",
            function()
                vim.diagnostic.setloclist()
            end,
            { expr = true, desc = "quickfix" },
        },
        {
            "d",
            cmd "Telescope diagnostics bufnr=0",
            { desc = "document diagnostic" },
        },
        {
            "w",
            cmd "Telescope diagnostics",
            { desc = "workspace diagnostic" },
        },
        {
            "i",
            cmd "LspInfo",
            { desc = "lsp info" },
        },
        {
            "F",
            function()
                vim.lsp.buf.format()
            end,
            { expr = true, desc = "format" },
        },
        {
            "l",
            function()
                vim.lsp.codelens.run()
            end,
            { desc = "codelens actions", exit = true, nowait = true },
        },
        { "<ESC>", nil, { exit = true, nowait = true, desc = "exit" } },
        { "q", nil, { exit = true, nowait = true, desc = "exit" } },
    },
}
