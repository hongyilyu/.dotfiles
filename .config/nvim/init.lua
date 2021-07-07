require "globals"
require "settings"
require "plugins"
require "config"
require "lhy-utils"
-- require "lhy-galaxyline"
-- require "lhy-which-key"
-- require "lhy-symbols-outline"
-- require "lhy-floatterm"
--
-- -- LSP
-- require "lsp"

require("lhy-utils").define_augroups {
  autoformat = {
    {
      "BufWritePre",
      "*",
      [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]],
    },
  },
}
