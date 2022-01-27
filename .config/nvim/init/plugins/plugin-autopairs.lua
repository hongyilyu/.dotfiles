local npairs = require "nvim-autopairs"
local Rule = require "nvim-autopairs.rule"
local cond = require('nvim-autopairs.conds')
local ts_conds = require "nvim-autopairs.ts-conds"

vim.g.completion_confirm_key = ""

npairs.setup({
  check_ts = true,
  ts_config = {
    lua = { "string" }, -- it will not add pair on that treesitter node
    javascript = { "template_string" },
    java = false, -- don't check treesitter on java
  },
})

-- press % => %% is only inside comment or string
npairs.add_rules {
  Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
  Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
  Rule("'", "'", "rust"):with_pair(cond.not_before_text_check({"&", "<"})),
}

