-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_user_command("Format", function()
  require("conform").format()
end, { range = true })

vim.api.nvim_create_user_command("FOrmat", function()
  require("conform").format()
end, { range = true })
