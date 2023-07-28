return function(_, _)
  local opts = {
    signs = {
      add = { hl = "GitSignsAdd", text = "▎" },
      change = { hl = "GitSignsChange", text = "▎" },
      delete = { hl = "GitSignsDelete", text = "_" },
      topdelete = { hl = "GitSignsDelete", text = "‾" },
      changedelete = { hl = "GitSignsChange", text = "~" },
    },
    numhl = false,
    linehl = false,
    watch_gitdir = {
      interval = 100,
      follow_files = true,
    },
    sign_priority = 6,
    update_debounce = 200,
    status_formatter = nil, -- Use default
  }

  require("gitsigns").setup(opts)
  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "Green", bg = "None" })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "Yellow", bg = "None" })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "Red", bg = "None" })
end
