lua <<EOF
local nvim_lsp = require'lspconfig'

local on_attach = function(client)
    require'completion'.on_attach(client)
end

nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})

local opts = {
    tools = { -- rust-tools options
        -- automatically set inlay hints (type hints)
        -- There is an issue due to which the hints are not applied on the first
        -- opened file. For now, write to the file to trigger a reapplication of
        -- the hints or just run :RustSetInlayHints.
        -- default: true
        autoSetHints = true,

        -- whether to show hover actions inside the hover window
        -- this overrides the default hover handler so something like lspsaga.nvim's hover would be overriden by this
        -- default: true
        hover_with_actions = true,

        -- These apply to the default RustRunnables command
        runnables = {
            -- whether to use telescope for selection menu or not
            -- default: true
            use_telescope = true

            -- rest of the opts are forwarded to telescope
        },

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
            -- wheter to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = "=> ",

            -- whether to align to the lenght of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7
        },

        hover_actions = {
            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
                {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                {"╰", "FloatBorder"}, {"│", "FloatBorder"}
            },

            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = false
        }
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {} -- rust-analyer options
}

require('rust-tools').setup(opts)

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
  "   (Text) ",
  "   (Method)",
  "   (Function)",
  "   (Constructor)",
  " ﴲ  (Field)",
  "[ ] (Variable)",
  "   (Class)",
  " \u{fa53}  (Interface)",
  "   (Module)",
  "   (Property)",
  "   (Unit)",
  "   (Value)",
  " \u{fa53} (Enum)",
  "   (Keyword)",
  "   (Snippet)",
  "   (Color)",
  "   (File)",
  "   (Reference)",
  "   (Folder)",
  "   (EnumMember)",
  " ﲀ  (Constant)",
  " ﳤ  (Struct)",
  "   (Event)",
  "   (Operator)",
  "   (TypeParameter)",
}
require('rust-tools.inlay_hints').set_inlay_hints()
EOF

call sign_define("LspDiagnosticsSignError",{
			\ "texthl": "LspDiagnosticsSignError",
			\ "text": " ",
			\ "numhl": "LspDiagnosticsSignError" })
call sign_define("LspDiagnosticsSignWarning",{
			\ "texthl": "LspDiagnosticsSignWarning",
			\ "text": " ",
			\ "numhl": "LspDiagnosticsSignWarning" })
call sign_define("LspDiagnosticsSignHint",{
			\ "texthl": "LspDiagnosticsSignHint",
			\ "text": " ",
			\ "numhl": "LspDiagnosticsSignHint" })
call sign_define("LspDiagnosticsSignInformation",{
			\ "texthl": "LspDiagnosticsSignInformation",
			\ "text": " ",
			\ "numhl": "LspDiagnosticsSignInformation" })



" See `:help vim.lsp.*` for documentation on any of the below functions
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <silent> <leader>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <silent> <leader>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <silent> <leader>D <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> <leader>q <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>


