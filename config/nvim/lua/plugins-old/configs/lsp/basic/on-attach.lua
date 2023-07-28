local utils = require("core.utils")
local M = {}

function _BUF_FORMAT()
  -- TODO: Move to global
  local only_null_ls = utils.Set({ "lua", "python" })
  vim.lsp.buf.format({
    filter = function(client)
      if only_null_ls[vim.bo.filetype] then
        return client.name == "null-ls"
      else
        return client.name ~= "null-ls"
      end
    end,
  })
end

local function lsp_highlight_document(client)
  require("illuminate").on_attach(client)
end

local function lsp_keymaps(bufnr)
  utils.nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  utils.nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  utils.nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  utils.nnoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  utils.vnoremap("<C-k>", "<cmd>RustHoverRange<CR>")
  utils.nnoremap("<Leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", true)
  utils.nnoremap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  utils.nnoremap("]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  -- Diagnostic jump with filters such as only jumping to an error
  utils.nnoremap("[e", "<cmd>lua vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }<CR>")
  utils.nnoremap("]e", "<cmd>lua vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }<CR>")

  vim.cmd([[ command! Format execute 'lua _BUF_FORMAT()' ]])
  vim.cmd([[ command! FOrmat execute 'lua _BUF_FORMAT()' ]])
end

--- The `on_attach` function used by NeoVim
--- @param client table The LSP client details when attaching
--- @param bufnr number The buffer that the LSP client is attaching to
M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

return M
