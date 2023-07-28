return function(_, opts)
  local new_opts = {
    mode = "symbol",
    symbol_map = {
      Array = "",
      Boolean = "⊨",
      Class = "",
      Constructor = "",
      Key = "",
      Namespace = "",
      Null = "NULL",
      Number = "#",
      Object = "",
      Package = "",
      Property = "",
      Reference = "",
      Snippet = "",
      String = "",
      TypeParameter = "",
      Unit = "",
    },
  }
  local combined_opts = require("core.utils").extend_tbl(opts, new_opts)
  require("lspkind").init(combined_opts)
end
