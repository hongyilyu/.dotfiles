local package = require("core.pack").package
local conf = require "modules.ui.config"

package { "tpope/vim-commentary" }
package { "rcarriga/nvim-notify" }
package { "RRethy/vim-illuminate" }
package { "chaoren/vim-wordmotion" }

package { "sainnhe/gruvbox-material", config = conf.colorscheme }
package { "psliwka/vim-smoothie", config = conf.smoothie }
package { "easymotion/vim-easymotion", config = conf.easymotion }
package { "windwp/nvim-autopairs", config = conf.autopairs }
package { "kyazdani42/nvim-tree.lua", config = conf.nvim_tree }
package { "goolord/alpha-nvim", config = conf.alpha }
package { "akinsho/toggleterm.nvim", config = conf.toggleterm }
package { "ggandor/leap.nvim", config = conf.leap }

package { "lukas-reineke/indent-blankline.nvim", ft = conf.ui_enabled_file_type(), config = conf.indent }
package { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, config = conf.lualine }
package { "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, config = conf.bufferline }
package { "lewis6991/gitsigns.nvim", event = { "BufRead", "BufNewFile" }, config = conf.gitsigns }
