local Hydra = require "hydra"
local gitsigns = require "gitsigns"
local cmd = require("hydra.keymap-util").cmd

local hint = [[
 _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
 _K_: prev hunk   _u_: undo last stage   _p_: preview hunk   _B_: blame show full
 _r_: reset hunk  _o_: git status        _c_: git commits
 _R_: reset file  _S_: stage buffer      ^ ^
 ^
 ^ ^              _<ESC>_: exit              _q_: exit
]]

Hydra {
    name = "Git",
    hint = hint,
    config = {
        color = "pink",
        invoke_on_body = true,
        hint = {
            border = "rounded",
        },
        on_enter = function()
            vim.cmd "mkview"
            vim.cmd "silent! %foldopen!"
            vim.bo.modifiable = false
            gitsigns.toggle_linehl(true)
        end,
        on_exit = function()
            local cursor_pos = vim.api.nvim_win_get_cursor(0)
            vim.cmd "loadview"
            vim.api.nvim_win_set_cursor(0, cursor_pos)
            vim.cmd "normal zv"
            gitsigns.toggle_linehl(false)
            gitsigns.toggle_deleted(false)
        end,
    },
    mode = { "n", "x" },
    body = "<leader>g",
    heads = {
        {
            "J",
            function()
                if vim.wo.diff then
                    return "]c"
                end
                vim.schedule(function()
                    gitsigns.next_hunk()
                end)
                return "<Ignore>"
            end,
            { expr = true, desc = "next hunk" },
        },
        {
            "K",
            function()
                if vim.wo.diff then
                    return "[c"
                end
                vim.schedule(function()
                    gitsigns.prev_hunk()
                end)
                return "<Ignore>"
            end,
            { expr = true, desc = "prev hunk" },
        },
        { "s", gitsigns.stage_hunk, { silent = true, desc = "stage hunk" } },
        { "u", gitsigns.undo_stage_hunk, { desc = "undo last stage" } },
        { "S", gitsigns.stage_buffer, { desc = "stage buffer" } },
        { "p", gitsigns.preview_hunk, { desc = "preview hunk" } },
        { "d", gitsigns.toggle_deleted, { nowait = true, desc = "toggle deleted" } },
        { "b", gitsigns.blame_line, { desc = "blame" } },
        {
            "r",
            function()
                vim.cmd "set ma"
                gitsigns.reset_hunk()
            end,
            { desc = "reset hunk" },
        },
        { "R", gitsigns.reset_buffer, { desc = "reset file" } },
        { "o", cmd "Telescope git_status", { desc = "Open changed file in Project" } },
        { "c", cmd "Telescope git_commits", { desc = "Checkout commit" } },
        {
            "B",
            function()
                gitsigns.blame_line { full = true }
            end,
            { desc = "blame show full" },
        },
        { "<ESC>", nil, { exit = true, nowait = true, desc = "exit" } },
        { "q", nil, { exit = true, nowait = true, desc = "exit" } },
    },
}
