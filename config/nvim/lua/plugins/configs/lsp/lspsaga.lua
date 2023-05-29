return function(_, _)
  require("lspsaga").setup {
    symbol_in_winbar = {
      enable = false,
    },
    diagnostic = {
      show_code_action = false,
      text_hl_follow = true,
      border_follow = false,
      custom_msg = "",
    },
  }
end
