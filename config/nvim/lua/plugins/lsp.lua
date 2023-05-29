return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        cmd = { "LspInstall", "LspUninstall" },
        opts = {
          ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "pyright", "taplo" },
          automatic_installation = true,
        },
        config = require "plugins.configs.lsp.mason-lspconfig",
      },
      {
        -- lsp progress gui, fidget spinner
        "j-hui/fidget.nvim",
        config = function()
          require("fidget").setup()
        end,
      },
    },
    event = "User LHY_File",
    config = require "plugins.configs.lsp.lspconfig",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      {
        "jay-babu/mason-null-ls.nvim",
        cmd = { "NullLsInstall", "NullLsUninstall" },
        opts = {
          ensure_installed = { "stylua", "prettier", "write_good", "markdownlint", "sql_formatter" },
          automatic_installation = true,
          handlers = {},
        },
      },
    },
    event = "User LHY_File",
    config = require "plugins.configs.lsp.null-ls",
  },
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
    },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_uninstalled = "✗",
          package_pending = "⟳",
        },
      },
    },
    config = require "plugins.configs.lsp.mason",
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = require "plugins.configs.lsp.lspsaga",
  },
}
