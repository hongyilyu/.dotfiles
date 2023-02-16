local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
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
    formatting.sql_formatter,
    formatting.trim_whitespace,
    formatting.trim_newlines,
    formatting.stylua,
    formatting.eslint,
    with_root_file(formatting.stylua, "stylua.toml"),

    -- diagnostics
    diagnostics.write_good,
    diagnostics.markdownlint,
    -- diagnostics.spectral,

    -- code actions

    -- hover
    hover.dictionary,
    hover.printenv,
}

require("mason-null-ls").setup {
    ensure_installed = { "stylua", "prettier", "write_good", "markdownlint", "sql_formatter" },
    automatic_installation = true,
}

null_ls.setup {
    disabled_filetypes = {"rust"},
    -- debug = true,
    sources = sources,
}
