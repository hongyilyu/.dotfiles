local M = {}
local Set = require("util").Set
local nnoremap = require("util").nnoremap
local vnoremap = require("util").vnoremap

-- TODO: backfill this to template
M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
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

local function lsp_highlight_document(client)
    require("illuminate").on_attach(client)
end

---@diagnostic disable-next-line: unused-local
local function lsp_keymaps(bufnr)
    ---@diagnostic disable-next-line: unused-local
    local opts = { noremap = true, silent = true }
    nnoremap("gd", "<cmd>Telescope lsp_definitions<CR>")
    nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
    nnoremap("gr", "<cmd>Telescope lsp_references<CR>")
    nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    nnoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    vnoremap("<C-k>", "<cmd>RustHoverRange<CR>")
    nnoremap("<Leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", true)
    vnoremap("<Leader>a", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")
    nnoremap("[d", "<cmd>lua vim.diagnostic.goto_prev({ border = \"rounded\" })<CR>")
    nnoremap("]d", "<cmd>lua vim.diagnostic.goto_next({ border = \"rounded\" })<CR>")
    nnoremap("gl", "<cmd>lua vim.diagnostic.open_float({ border = \"rounded\" })<CR>")
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting_sync()' ]]
end

M.on_attach = function(client, bufnr)
    -- Disable in favor of null-ls
    local disable = Set { "tsserver", "sumneko_lua" }
    if disable[client.name] then
        client.resolved_capabilities.document_formatting = false
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = require "cmp_nvim_lsp"
M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
