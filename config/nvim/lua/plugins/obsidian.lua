return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    "BufReadPre " .. vim.fn.expand "~" .. "/Databases/LifeOS/*.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/Databases/LifeOS/*.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "LifeOS",
        path = "~/Databases/LifeOs",
      },
    },

    -- see below for full list of options 👇
  },
}
