return function(_, opts)
  require("plugins/configs/keymaps/whichkey/wk-normal")
  require("plugins/configs/keymaps/whichkey/wk-visual")
  require("plugins/configs/keymaps/whichkey/wk-ignore")

  require("which-key").setup(opts)
end
