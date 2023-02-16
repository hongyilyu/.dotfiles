local config = {}

function config.cmp()
    require("modules.lsp.config.cmp")
end

function config.lspsaga()
    require("modules.lsp.config.lspsaga")
end

function config.lspconfig()
    require("modules.lsp.config.lspconfig")
    require("fidget").setup()
end

function config.null_ls()
    require("modules.lsp.config.null_ls")
end

function config.crates()
    require("crates").setup {
        null_ls = {
            enabled = true,
            name = "crates.nvim",
        },
    }
end

function config.lua_snip()
    local ls = require('luasnip')
    ls.config.set_config({
        delete_check_events = 'TextChanged',
    })
    require('luasnip.loaders.from_vscode').lazy_load({
        paths = { './snippets/' },
    })
end

return config
