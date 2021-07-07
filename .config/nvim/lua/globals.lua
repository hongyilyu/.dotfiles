CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"

O = {
  document_highlight = true,

  -- @usage pass a table with your desired languages
  treesitter = {
    ensure_installed = "all",
    ignore_install = { "haskell" },
    highlight = { enabled = true },
    -- The below are for treesitter-textobjects plugin
    textobj_prefixes = {
      goto_next = "]", -- Go to next
      goto_previous = "[", -- Go to previous
      inner = "i", -- Select inside
      outer = "a", -- Selct around
      swap = "<leader>a", -- Swap with next
    },
    textobj_suffixes = {
      -- Start and End respectively for the goto keys
      -- for other keys it only uses the first
      ["function"] = { "f", "F" },
      ["class"] = { "m", "M" },
      ["parameter"] = { "a", "A" },
      ["block"] = { "k", "K" },
      ["conditional"] = { "i", "I" },
      ["call"] = { "c", "C" },
      ["loop"] = { "l", "L" },
      ["statement"] = { "s", "S" },
      ["comment"] = { "/", "?" },
    },
    -- The below is for treesitter hint textobjects plugin
    hint_labels = { "h", "j", "f", "d", "n", "v", "s", "l", "a" },
  },

  plugin = {
    -- Builtins
    ts_playground = { active = false },
    ts_context_commentstring = { active = false },
    ts_hintobjects = { active = false },
    ts_autotag = { active = false },
    ts_rainbow = { active = false },
    ts_textobjects = { active = false },
    ts_textsubjects = { active = false },
    telescope_fzy = { active = false },
    telescope_project = { active = false },
    indent_line = { active = false },
    symbol_outline = { active = false },
    debug = { active = false },
    dap_install = { active = false },
    lush = { active = false },
    diffview = { active = false },
    floatterm = { active = false },
    trouble = { active = false },
    sanegx = { active = false },
  },

  custom_plugins = {
    -- use lv-config.lua for this not put here
  },
}
