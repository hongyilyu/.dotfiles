local config = {}

function config.whichkey()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require "modules.keymap.config.whichkey"
end

function config.hydra()
    require "modules.keymap.config.hydra"
end

return config
