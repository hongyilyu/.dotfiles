local nnoremap = require("util").nnoremap

vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_session_directory = vim.fn.stdpath('data') .. '/dashboard-sessions'

vim.g.dashboard_custom_section = {
    a = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    b = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    c = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    g = {description = {'  Marks              '}, command = 'Telescope marks'},
}

-- key mappings
nnoremap('<leader>ss', ':SessionSave<CR>')
nnoremap('<leader>sl', ':SessionLoad<CR>')
