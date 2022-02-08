local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover

local with_root_file = function(builtin, file)
    return builtin.with {
        condition = function(utils)
            return utils.root_has_file(file)
        end,
    }
end

local sources = {
    -- formatting
    formatting.prettier,
    formatting.trim_whitespace,
    formatting.trim_newlines,
    formatting.stylua,
    with_root_file(formatting.stylua, "stylua.toml"),

    -- diagnostics
    diagnostics.write_good,
    diagnostics.markdownlint,
    diagnostics.tsc,
    diagnostics.eslint,
    diagnostics.yamllint,

    -- code actions
    code_actions.gitsigns,

    -- hover
    hover.dictionary,
}

null_ls.setup {
    -- debug = true,
    sources = sources,
}
