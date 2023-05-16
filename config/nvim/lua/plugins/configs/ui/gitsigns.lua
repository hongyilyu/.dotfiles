return function(_, opts)
  local new_opts = {
    signs = {
      add = { hl = "GitSignsAdd", text = "▎" },
      change = { hl = "GitSignsChange", text = "▎" },
      delete = { hl = "GitSignsDelete", text = "_" },
      topdelete = { hl = "GitSignsDelete", text = "‾" },
      changedelete = { hl = "GitSignsChange", text = "~" },
    },
    numhl = false,
    linehl = false,
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,
    },
    watch_gitdir = {
      interval = 100,
      follow_files = true,
    },
    sign_priority = 6,
    update_debounce = 200,
    status_formatter = nil, -- Use default
  }

  local combined_opts = require("core.utils").extend_tbl(opts, new_opts)
  require("gitsigns").setup(combined_opts)
  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "Green", bg = "None" })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "Yellow", bg = "None" })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "Red", bg = "None" })
end
