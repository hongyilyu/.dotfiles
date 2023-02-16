local builtin = require "telescope.builtin"

local dropdown_theme = require("telescope.themes").get_dropdown {
    result_height = 20,
    winblend = 20,
    width = 0.8,
    prompt_title = "",
    prompt_prefix = " Files > ",
    previewer = false,
}
local full_theme = {
    winblend = 20,
    width = 0.8,
    show_line = false,
    prompt_title = "",
    prompt_prefix = " Files > ",
    result_title = "",
    preview_title = "",
}

local finder = {}

function finder.edit_neovim()
    local opts = vim.deepcopy(dropdown_theme)
    opts.prompt_title = "~ VimRC ~"
    opts.prompt_prefix = " Nvim > "
    opts.cwd = vim.fn.stdpath "config"

    builtin.fd(opts)
end

function finder.ctrl_p()
    local opts = vim.deepcopy(dropdown_theme)
    opts.width = 0.5
    opts.hidden = true
    opts.find_command = { "rg", "--files", "--hidden", "--no-ignore" }

    builtin.fd(opts)
end

return finder
