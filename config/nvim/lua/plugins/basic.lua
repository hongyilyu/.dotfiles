return {
  "nvim-lua/plenary.nvim",
  { "nvim-lualine/lualine.nvim", config = require "plugins.configs.basic.lualine" },
  { "sainnhe/gruvbox-material", config = require "plugins.configs.basic.gruvbox-material" },
  { "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" } },
  {
    "NMAC427/guess-indent.nvim",
    event = "User LHY_File",
    config = require "plugins.configs.basic.guess-indent",
  },
  { "s1n7ax/nvim-window-picker", opts = { use_winbar = "smart" } },
  {
    "psliwka/vim-smoothie",
    event = "VeryLazy",
  },
  { "chaoren/vim-wordmotion" },
  { "RRethy/vim-illuminate" },
  { "easymotion/vim-easymotion", config = require "plugins.configs.basic.easymotion" },
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   event = { "User LHY_File", "InsertEnter" },
  --   dependencies = { "kevinhwang91/promise-async" },
  --   opts = {
  --     preview = {
  --       mappings = {
  --         scrollB = "<C-b>",
  --         scrollF = "<C-f>",
  --         scrollU = "<C-u>",
  --         scrollD = "<C-d>",
  --       },
  --     },
  --     provider_selector = function(_, filetype, buftype)
  --       local function handleFallbackException(bufnr, err, providerName)
  --         if type(err) == "string" and err:match "UfoFallbackException" then
  --           return require("ufo").getFolds(bufnr, providerName)
  --         else
  --           return require("promise").reject(err)
  --         end
  --       end

  --       return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
  --           or function(bufnr)
  --             return require("ufo")
  --                 .getFolds(bufnr, "lsp")
  --                 :catch(function(err) return handleFallbackException(bufnr, err, "treesitter") end)
  --                 :catch(function(err) return handleFallbackException(bufnr, err, "indent") end)
  --           end
  --     end,
  --   },
  -- },
}
