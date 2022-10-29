require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "sumneko_lua", "rust_analyzer", "tsserver", "pyright" },
    automatic_installation = true,
}

local lspconfig = require "lspconfig"

local opts = {
    on_attach = require("plugin.lsp.handler").on_attach,
    capabilities = require("plugin.lsp.handler").capabilities,
}

require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    ["rust_analyzer"] = function()
        local rust_tools_opts = require "plugin.lsp.language.rust_analyzer"
        require("rust-tools").setup(rust_tools_opts)
    end,
    ["sumneko_lua"] = function()
        local sumneko_opts = require "plugin.lsp.language.sumneko_lua"
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
        lspconfig.sumneko_lua.setup(opts)
    end,
    ["pyright"] = function()
        local pyright_opts = require "plugin.lsp.language.pyright"
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
        lspconfig.pyright.setup(opts)
    end,
}
