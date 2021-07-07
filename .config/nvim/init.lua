require "globals"
require "settings"
require "plugins"
require "lhy-utils"
require "lhy-gruvbox"
require "lhy-treesitter"
require "lhy-telescope"
require "lhy-barbar"
require "lhy-galaxyline"
require "lhy-gitsigns"
require "lhy-comment"
require "lhy-autopairs"
require "lhy-symbols-outline"
require "lhy-which-key"
require "lhy-nvim-tree"
require "lhy-compe"
require "lhy-floatterm"

-- LSP
require "lsp"
require "lsp.rust-lsp"

require("lhy-utils").define_augroups {
  autoformat = {
    {
      "BufWritePre",
      "*",
      [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]],
    },
  },
}
