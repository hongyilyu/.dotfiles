require("core").init()

return {
  { "folke/lazy.nvim", version = "*" },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = require("plugins.configs.ui.gruvbox-material"),
  },
}
