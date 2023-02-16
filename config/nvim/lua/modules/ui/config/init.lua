local conf = {}

function conf.ui_enabled_file_type()
    return {
        "lua",
        "sh",
        "rust",
        "typescript",
        "json",
        "java",
    }
end

function conf.leap()
    require("leap").add_default_mappings()
    vim.keymap.del({ "x", "o" }, "x")
    vim.keymap.del({ "x", "o" }, "X")
    vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
end

function conf.smoothie()
    vim.g.smoothie_experimental_mappings = 1
end

function conf.easymotion()
    vim.g.EasyMotion_smartcase = 1
    vim.cmd [[
        map  / <Plug>(easymotion-sn)
        omap / <Plug>(easymotion-tn)
    ]]
end

function conf.colorscheme()
    require "modules.ui.config.colorscheme"
end

function conf.indent()
    require "modules.ui.config.indent_blankline"
end

function conf.gitsigns()
    require "modules.ui.config.gitsigns"
end

function conf.autopairs()
    require "modules.ui.config.autopairs"
end

function conf.lualine()
    require "modules.ui.config.lualine"
end

function conf.bufferline()
    require "modules.ui.config.bufferline"
end

function conf.nvim_tree()
    require "modules.ui.config.nvim_tree"
end

function conf.alpha()
    require "modules.ui.config.alpha"
end

function conf.toggleterm()
    require "modules.ui.config.toggleterm"
end

return conf
