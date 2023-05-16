return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag", -- for html
      "JoosepAlviste/nvim-ts-context-commentstring", -- for comment
      "HiPhish/nvim-ts-rainbow2", -- for parentheses
      "nvim-treesitter/nvim-treesitter-textobjects", -- for text-object
      {
        "nvim-treesitter/nvim-treesitter-context", -- for parent function
        config = function()
          require("treesitter-context").setup()
        end,
      },
    },
    event = "User LHY_File",
    cmd = {
      "TSBufDisable",
      "TSBufEnable",
      "TSBufToggle",
      "TSDisable",
      "TSEnable",
      "TSToggle",
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSModuleInfo",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
    },
    build = ":TSUpdate",
    opts = {
      highlight = {
        enable = true,
        disable = function(_, bufnr)
          return vim.api.nvim_buf_line_count(bufnr) > 10000
        end,
      },
      incremental_selection = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      rainbow = { enable = true },
      ensure_installed = {
        "markdown",
        "markdown_inline",
        "vim",
        "rust",
        "lua",
        "java",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
