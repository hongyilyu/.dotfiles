require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '▎'},
    change       = {hl = 'GitSignsChange', text = '▎'},
    delete       = {hl = 'GitSignsDelete', text = '_'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾'},
    changedelete = {hl = 'GitSignsChange', text = '~'},
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,
  },
  watch_index = {
    interval = 100
  },
  sign_priority = 6,
  update_debounce = 200,
  status_formatter = nil -- Use default
}
