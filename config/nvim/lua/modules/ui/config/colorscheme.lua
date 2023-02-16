local colors = require("core.color").colors

vim.g.background = "dark"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_sign_column_background = "clear"
vim.o.signcolumn = "yes:2"

if not vim.api.nvim_get_option "termguicolors" then
    vim.o.termguicolors = true
end

vim.cmd [[colorscheme gruvbox-material]]


-- custom highlights
vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.bg3 })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = colors.none })

vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.bg5, fg = colors.green })
vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.bg3, fg = colors.fg0 })
-- Sbar fg does not take effect...
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.bg9, fg = colors.grey2 })
vim.api.nvim_set_hl(0, "PMenuThumb", { fg = colors.aqua })
