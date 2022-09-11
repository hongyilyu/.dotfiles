local lsp_status = require "lsp-status"

lsp_status.config({
    status_symbol = ' ',
    diagnostics = false,
    current_function = false,
})

lsp_status.register_progress()
