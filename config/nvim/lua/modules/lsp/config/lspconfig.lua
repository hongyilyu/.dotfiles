require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "pyright" },
    automatic_installation = true,
}
require("modules.lsp.config.handler").setup()

local opts = {
    on_attach = require("modules.lsp.config.handler").on_attach,
    capabilities = require("modules.lsp.config.handler").capabilities,
}

local lspconfig = require "lspconfig"

require("mason-lspconfig").setup_handlers({
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup(opts)
    end,
    ["rust_analyzer"] = function()
        local rust_tools_opts = require "modules.lsp.config.language.rust_analyzer"
        require("rust-tools").setup(rust_tools_opts)
    end,
    ["lua_ls"] = function()
        local lua_opts = require "modules.lsp.config.language.lua_ls"
        opts = vim.tbl_deep_extend("force", lua_opts, opts)
        lspconfig.lua_ls.setup(opts)
    end,
})
