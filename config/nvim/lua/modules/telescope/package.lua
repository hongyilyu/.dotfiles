local package = require("core.pack").package
local conf = require "modules.telescope.config"

package {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = conf.telescope,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
    },
}

package {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = false,
    config = function()
        require("telescope").load_extension "fzf"
    end,
}

package {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
        require("telescope").load_extension "ui-select"
    end,
}

package {
    "AckslD/nvim-neoclip.lua",
    config = function()
        require("telescope").load_extension "neoclip"
        require("neoclip").setup()
    end,
}

package {
    "ahmedkhalf/project.nvim",
    config = conf.extension_project,
}
