return function(_, opts)
  local npairs = require "nvim-autopairs"
  local new_opts = {
    check_ts = true,
    ts_config = { java = false },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", "\"", "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0,
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  }
  local combined_opts = require("core.utils").extend_tbl(opts, new_opts)
  npairs.setup(combined_opts)

  local cmp_status_ok, cmp = pcall(require, "cmp")
  if cmp_status_ok then
    cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done { tex = false })
  end
end
