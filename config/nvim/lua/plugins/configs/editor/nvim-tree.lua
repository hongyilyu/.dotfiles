return function(_, _)
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

  require("nvim-tree").setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
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
      custom = { "node_modules", ".cache", "__pycache__" },
      exclude = { ".env" },
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
  })
end
