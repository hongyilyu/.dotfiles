local nvim_tree_icons = {
    default = "  ",
    symlink = "  ",
    git = {
        unstaged = "+",
        staged = "✓ ",
        unmerged = " ",
        renamed = "➜ ",
        untracked = "★ ",
        deleted = "  ",
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

vim.api.nvim_set_var("nvim_tree_icons", nvim_tree_icons)

require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = { "startify", "dashboard" },
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {},
    },
    system_open = {
        cmd = nil,
        args = {},
    },
    filters = {
        dotfiles = false,
        custom = { ".git", "node_modules", ".cache", "__pycache__" },
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = "left",
        mappings = {
            custom_only = false,
            list = {},
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes",
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
}
