return function(_, opts)
  require("mason-lspconfig").setup(opts)
  local lsp_opts = {
    on_attach = require("plugins.configs.lsp.basic.on-attach").on_attach,
    capabilities = require("plugins.configs.lsp.basic.capability").capabilities,
  }
  require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup(lsp_opts)
    end,
    ["rust_analyzer"] = function()
        local rust_tools_opts = require "plugins.configs.lsp.server.rust"
        require("rust-tools").setup(rust_tools_opts)
    end,
  }

  require("core.utils").event "MasonLspSetup"
end
