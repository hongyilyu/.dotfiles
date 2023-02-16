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
    },
}

-- If you want insert `(` after select function or method item
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp = require "cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
