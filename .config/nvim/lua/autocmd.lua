-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank {}
    end,
    group = highlight_group,
})

-- Disable comment new line
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove { "c", "r", "o" }
    end,
})

vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
    pattern = "tsconfig.json",
    callback = function()
        vim.opt.filetype = "jsonc"
    end,
})

-- Open file at location that was last viewed
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        vim.cmd [[
        if line("'\"") > 1 && line("'\"") <= line("$") |
            exe "normal! g`\"" |
        endif
        ]]
    end,
})
