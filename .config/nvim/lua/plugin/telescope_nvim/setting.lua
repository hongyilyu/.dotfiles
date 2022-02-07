local telescope = require "telescope"
local previewers = require "telescope.previewers"
local actions = require "telescope.actions"

local new_preview_maker = function(filepath, bufnr, opts)
    opts = opts or {}

    filepath = vim.fn.expand(filepath)
    vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then
            return
        end
        if stat.size > 100000 then
            return
        else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
    end)
    previewers.buffer_previewer_maker(filepath, bufnr, opts)
end

telescope.setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--hidden",
            "--files",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = {
            "node_modules",
            ".git",
            "target",
        },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "absolute" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = new_preview_maker,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-p>"] = actions.close,
                -- To disable a keymap, put [map] = false
                -- So, to not map "<C-n>", just put
                -- ["<c-x>"] = false,

                -- Otherwise, just set the mapping to the function that you want it to be.
                -- ["<C-i>"] = actions.select_horizontal,

                -- Add up multiple actions
                ["<CR>"] = actions.select_default + actions.center,
                -- ["<C-p>"] = actions.close,

                -- You can perform as many actions in a row as you like
                -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<esc>"] = actions.close,
                -- ["<C-i>"] = my_cool_custom_action,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        bookmarks = {
            -- Available: 'brave', 'buku', 'chrome', 'edge', 'safari', 'firefox'
            selected_browser = "firefox",
            -- Either provide a shell command to open the URL
            url_open_command = "open",
            -- Or provide the plugin name which is already installed
            -- Available: 'vim_external', 'open_browser'
            url_open_plugin = nil,
            -- Show the full path to the bookmark instead of just the bookmark name
            full_path = true,
            -- Provide a custom profile name for Firefox
            firefox_profile_name = "default-release",
        },
        command_palette = {
            {
                "File",
                { "Yank Current File Name", ":lua require('joel.funcs').yank_current_file_name()" },
                { "Write Current Buffer", ":w" },
                { "Write All Buffers", ":wa" },
                { "Quit", ":qa" },
                { "File Browser", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
                { "Search for Word", ":lua require('telescope.builtin').live_grep()", 1 },
                { "Git Files", ":lua require('telescope.builtin').git_files()", 1 },
            },
            {
                "Help",
                { "Search Help", ":lua require('telescope.builtin').help_tags()", 1 },
            },
            {
                "Neovim",
                { "checkhealth", ":checkhealth" },
                { "commands", ":lua require('telescope.builtin').commands()" },
                { "command history", ":lua require('telescope.builtin').command_history()" },
                { "registers", ":lua require('telescope.builtin').registers()" },
                { "options", ":lua require('telescope.builtin').vim_options()" },
                { "keymaps", ":lua require('telescope.builtin').keymaps()" },
                { "buffers", ":Telescope buffers" },
                { "search history", ":lua require('telescope.builtin').search_history()" },
                { "cursor line", ":set cursorline!" },
                { "cursor column", ":set cursorcolumn!" },
                { "spell checker", ":set spell!" },
                { "relative number", ":set relativenumber!" },
                { "search highlighting", ":set hlsearch!" },
            },
        },
    },
}

require("telescope").load_extension "fzf"
require("telescope").load_extension "command_palette"
-- require('telescope').load_extension('bookmarks') -- disable due to sqlite issue https://github.com/dhruvmanila/telescope-bookmarks.nvim/issues/5

require("telescope").load_extension "neoclip"
require("neoclip").setup()
