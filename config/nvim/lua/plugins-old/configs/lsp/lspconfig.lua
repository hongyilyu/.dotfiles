local setup_servers = require("plugins.configs.lsp.custom.setup")

return function(_, _)
  require("neodev").setup({
})
  require("plugins.configs.lsp.basic.diagnostic")()

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", silent = true })
  vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded", silent = true })

  -- Setup normal servers through mason, then callback to setup custom servers
  if require("core.utils").is_available "mason-lspconfig.nvim" then
    vim.api.nvim_create_autocmd("User", { pattern = "LHY_MasonLspSetup", once = true, callback = setup_servers })
  else
    setup_servers()
  end
end
