local nvim_tree_icons = {
    default = "  ",
    symlink = "  ",
    git = {
        unstaged = "+",
        staged = "✓ ",
        unmerged = " ",
        renamed = "➜ ",
        untracked = "★ ",
        deleted = "",
        ignored = "◌ ",
    },
    folder = {
        default = "  ",
        open = "  ",
        empty = "  ",
        empty_open = "  ",
        symlink = "  ",
    },
}

-- vim.api.nvim_set_var("nvim_tree_icons", nvim_tree_icons)

require("nvim-tree").setup {
    ignore_ft_on_setup = { "startify", "dashboard" },
    renderer = {
        icons = { glyphs = nvim_tree_icons },
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = true,
        custom = { ".git", "node_modules", ".cache", "__pycache__" },
        exclude = {".env"}
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
}
