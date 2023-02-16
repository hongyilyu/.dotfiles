local package = require('core.pack').package
local conf = require('modules.keymap.config')

require("modules.keymap.config.misc")

package({
    "anuvyklack/hydra.nvim",
    config = conf.hydra,
})

package({
    "folke/which-key.nvim",
    config = conf.whichkey,
})
