require("lspconfig").rust_analyzer.setup {
  cmd = { DATA_PATH .. "/lspinstall/rust/rust-analyzer" },
  on_attach = require("lsp").common_on_attach,
  filetypes = { "rust" },
  root_dir = require("lspconfig.util").root_pattern("Cargo.toml", "rust-project.json"),
  settings = {
    ["rust-analyzer"] = {
      assist = {},
      diagnostics = {},
      cargo = {},
      procMacro = {
        enable = true,
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}

vim.api.nvim_exec(
  [[
    autocmd Filetype rust nnoremap <leader>lm <Cmd>RustExpandMacro<CR>
    autocmd Filetype rust nnoremap <leader>lH <Cmd>RustToggleInlayHints<CR>
    autocmd Filetype rust nnoremap <leader>le <Cmd>RustRunnables<CR>
    autocmd Filetype rust nnoremap <leader>lh <Cmd>RustHoverActions<CR>
    ]],
  true
)
