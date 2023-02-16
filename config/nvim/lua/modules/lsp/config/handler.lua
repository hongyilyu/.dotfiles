local M = {}
local Set = require("core.util").Set
local nnoremap = require("core.util").nnoremap
local vnoremap = require("core.util").vnoremap

-- TODO: backfill this to template
M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn",  text = "" },
        { name = "DiagnosticSignHint",  text = "" },
        { name = "DiagnosticSignInfo",  text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        virtual_text = true,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
        })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "rounded",
        })
end

-- Capabilities
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- On Attach
local function lsp_highlight_document(client)
    require("illuminate").on_attach(client)
end

---@diagnostic disable-next-line: unused-local
local function lsp_keymaps(bufnr)
    ---@diagnostic disable-next-line: unused-local
    local opts = { noremap = true, silent = true }
    nnoremap("gd", "<cmd>Lspsaga goto_definition<CR>")
    nnoremap("gp", "<cmd>Lspsaga peek_definition<CR>")
    nnoremap("gr", "<cmd>Lspsaga lsp_finder<CR>")
    nnoremap("K", "<cmd>Lspsaga hover_doc<CR>")
    nnoremap("<C-k>", "<cmd>Lspsaga signature_help<CR>")
    vnoremap("<C-k>", "<cmd>RustHoverRange<CR>")
    nnoremap("<Leader>a", "<cmd>Lspsaga code_action<CR>", true)
    nnoremap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    nnoremap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
    nnoremap("[e", "<cmd>lua require('lspsaga.diagnostic'):goto_prev { severity = vim.diagnostic.severity.ERROR }<CR>")
    nnoremap("]e", "<cmd>lua require('lspsaga.diagnostic'):goto_next { severity = vim.diagnostic.severity.ERROR }<CR>")
    -- Diagnostic jump with filters such as only jumping to an error
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
    vim.cmd [[ command! FOrmat execute 'lua vim.lsp.buf.format()' ]]
end

M.on_attach = function(client, bufnr)
    -- Disable in favor of null-ls
    local disable = Set {}
    if disable[client.name] then
        client.server_capabilities.document_formatting = false
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

return M
