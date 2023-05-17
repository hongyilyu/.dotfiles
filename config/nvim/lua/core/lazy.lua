local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local output = vim.fn.system { "git", "clone", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath }
  if vim.api.nvim_get_vvar "shell_error" ~= 0 then
    vim.api.nvim_err_writeln("Error cloning lazy.nvim repository...\n\n" .. output)
  end
  local oldcmdheight = vim.opt.cmdheight:get()
  vim.opt.cmdheight = 1
  vim.notify "Please wait while plugins are installed..."
  vim.api.nvim_create_autocmd("User", {
    once = true,
    pattern = "LazyInstall",
    callback = function()
      vim.cmd.bw()
      vim.opt.cmdheight = oldcmdheight
      vim.tbl_map(function(module)
        pcall(require, module)
      end, { "nvim-treesitter", "mason" })
      require("core.utils").notify "Mason is installing packages if configured, check status with :Mason"
    end,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  import = "plugins",
  defaults = { lazy = true },
  install = { colorscheme = "gruvbox-material" },
  performance = {
    rtp = {
      disabled_plugins = { "tohtml", "gzip", "zipPlugin", "netrwPlugin", "tarPlugin" },
    },
  },
  lockfile = vim.fn.stdpath "data" .. "/lazy/lazy-lock.json",
}

if not pcall(vim.cmd.colorscheme, "gruvbox-material") then
  require("core.utils").notify("Error setting up colorscheme: ", "error")
end