local lsp_installer = require "nvim-lsp-installer"
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("plugin.lsp.handler").on_attach,
        capabilities = require("plugin.lsp.handler").capabilities,
    }

    if server.name == "rust_analyzer" then
        local rust_tools_opts = require "plugin.lsp.language.rust_analyzer"
        rust_tools_opts.server = vim.tbl_deep_extend("force", server:get_default_options(), rust_tools_opts.server, opts)
        require("rust-tools").setup(rust_tools_opts)
        server:attach_buffers()
        -- Only if standalone support is needed
        require("rust-tools").start_standalone_if_required()
        return
    end

    if server.name == "jsonls" then
        local jsonls_opts = require "plugin.lsp.language.jsonls"
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server.name == "sumneko_lua" then
        local sumneko_opts = require "plugin.lsp.language.sumneko_lua"
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server.name == "pyright" then
        local pyright_opts = require "plugin.lsp.language.pyright"
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
