local alpha = require "alpha"
local dashboard = require "alpha.themes.dashboard"

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
    dashboard.button("t", "  > Find text", ":Telescope live_grep <CR>"),
    dashboard.button("p", "  > Find project", ":Telescope projects <CR>"),
    dashboard.button("s", "  > Settings", ":lua require('plugin.telescope_nvim.finder').edit_neovim()<CR>"),
    dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

local fortune = require "alpha.fortune"
dashboard.section.footer.val = fortune()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "String"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd [[
    autocmd FileType alpha setlocal nofoldenable
]]
