local gruvbox_material = require "lualine.themes.gruvbox-material"

local diff = {
    "diff",
    colored = true, -- Displays a colored diff status if set to true
    diff_color = {
        -- Same color values as the general color option can be used here.
        added = { bg = gruvbox_material.normal.b.bg, fg = gruvbox_material.insert.a.bg },
        modified = { bg = gruvbox_material.normal.b.bg, fg = gruvbox_material.replace.a.bg },
        removed = { bg = gruvbox_material.normal.b.bg, fg = gruvbox_material.visual.a.bg },
    },
    symbols = { added = "+", modified = "~", removed = "-" },
    source = nil, -- A function that works as a data source for diff.
    -- It must return a table as such:
    --   { added = add_count, modified = modified_count, removed = removed_count }
    -- or nil on failure. count <= 0 won't be displayed.
}

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    diagnostics_color = {
        error = { bg = gruvbox_material.normal.c.bg, fg = gruvbox_material.visual.a.bg },
        warn = { bg = gruvbox_material.normal.c.bg, fg = gruvbox_material.replace.a.bg },
    },
}

local filename = {
    "filename",
    file_status = false, -- Displays file status (readonly status, modified status)
    path = 1, -- 0: Just the filename
    -- 1: Relative path
    -- 2: Absolute path

    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
    -- for other components. (terrible name, any suggestions?)
}

local function lsp()
    return require("lsp-status").status()
end

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "gruvbox-material",
        component_separators = { left = "", right = "︱" },
        section_separators = { left = "", right = " " },
        disabled_filetypes = {"dapui*", "dap-repl"},
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", diff },
        lualine_c = { filename },

        lualine_x = { lsp, diagnostics },
        lualine_y = { "encoding" },
        lualine_z = { "location", "progress" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = { "nvim-tree", "symbols-outline", "quickfix", "toggleterm", "nvim-dap-ui" },
}
