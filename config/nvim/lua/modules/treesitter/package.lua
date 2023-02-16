local package = require("core.pack").package
local conf = require "modules.treesitter.config"

package { "JoosepAlviste/nvim-ts-context-commentstring" }
package { "p00f/nvim-ts-rainbow" }
package { "nvim-treesitter/nvim-treesitter-context", config = conf.ts_context }

package {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    build = ":TSUpdate",
    config = conf.nvim_treesitter,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
}
