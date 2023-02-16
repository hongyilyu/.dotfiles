local package = require('core.pack').package
local conf = require('modules.lsp.config')

package({
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = conf.cmp,
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
    },
})

package({
    'L3MON4D3/LuaSnip',
    event = 'InsertCharPre',
    config = conf.lua_snip,
    dependencies = { 'saadparwaiz1/cmp_luasnip' },
})

package({
    'williamboman/mason-lspconfig.nvim',
    config = conf.lspconfig,
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "j-hui/fidget.nvim", -- lsp status
    },
})

package({
    "jayp0521/mason-null-ls.nvim",
    config = conf.null_ls,
    dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
    }
})

-- rust
package({
    "saecki/crates.nvim",
    tag = "v0.3.0",
    config = conf.crates,
    dependencies = {
        "simrat39/rust-tools.nvim"
    }
})

package({
    'glepnir/lspsaga.nvim',
    config = conf.lspsaga,
})
