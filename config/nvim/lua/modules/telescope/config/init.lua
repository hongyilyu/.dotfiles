local config = {}

function config.telescope()
    require("modules.telescope.config.setting")
end

function config.extension_project()
    require("modules.telescope.config.extension.project")
end

return config
