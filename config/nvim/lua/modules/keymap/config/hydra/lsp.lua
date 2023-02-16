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
            vim.lsp.buf.code_action,
            { desc = "code actions" },
        },
        {
            "r",
            vim.lsp.buf.rename,
            { desc = "rename variable" },
        },
        {
            "f",
            vim.diagnostic.setloclist,
            { desc = "quickfix" },
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
            vim.lsp.buf.format,
            { desc = "format" },
        },
        {
            "l",
            vim.lsp.codelens.run,
            { desc = "codelens actions", exit = true, nowait = true },
        },
        { "<ESC>", nil, { exit = true, nowait = true, desc = "exit" } },
        { "q", nil, { exit = true, nowait = true, desc = "exit" } },
    },
}
