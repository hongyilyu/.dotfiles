local term = require("FTerm.terminal")

local gitui = term:new():setup({
    cmd = "gitui",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

 -- Use this to toggle gitui in a floating terminal
function _G.__fterm_gitui()
    gitui:toggle()
end

vim.api.nvim_set_keymap(
    "n",
    "<leader>gg",
    "<cmd>lua _G.__fterm_gitui()<CR>",
    { noremap = true, silent = true }
  )
