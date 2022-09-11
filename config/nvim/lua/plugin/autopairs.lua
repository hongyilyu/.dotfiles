local npairs = require "nvim-autopairs"

vim.g.completion_confirm_key = ""

npairs.setup {
    disable_filetype = { "TelescopePrompt" },
    check_ts = true,
    fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", "\"", "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
    },
    ts_config = {
        lua = { "string" }, -- it will not add pair on that treesitter node
        javascript = { "template_string" },
        java = false, -- don't check treesitter on java
    },
}


require('nvim-autopairs.completion.cmp')
