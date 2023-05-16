return function(_, opts)
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
    dashboard.button("s", "  > Settings", ":lua require('modules.telescope.config.finder').edit_neovim()<CR>"),
    dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
  }

  local fortune = require "alpha.fortune"
  dashboard.section.footer.val = fortune()

  dashboard.section.footer.opts.hl = "Type"
  dashboard.section.header.opts.hl = "String"
  dashboard.section.buttons.opts.hl = "Keyword"

  dashboard.opts.opts.noautocmd = true

  -- Disable folding on alpha buffer
  vim.cmd [[
      autocmd FileType alpha setlocal nofoldenable
  ]]

  dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }
  dashboard.config.layout[3].val = 5
  -- Send config to alpha
  alpha.setup(dashboard.opts)
end
