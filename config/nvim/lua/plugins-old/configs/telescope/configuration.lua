return function(_, opts)
  local telescope = require "telescope"
  telescope.setup(opts)
  local utils = require "core.utils"
  local conditional_func = utils.conditional_func
  conditional_func(telescope.load_extension, utils.is_available "telescope-fzf-native.nvim", "fzf")
  conditional_func(telescope.load_extension, utils.is_available "neoclip", "neoclip")
end
