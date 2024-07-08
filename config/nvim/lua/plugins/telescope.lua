local no_preview = function()
  return require("telescope.themes").get_dropdown({
    borderchars = {
      { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
    width = 0.8,
    previewer = false,
    prompt_title = false,
    cwd = require("lazy.core.config").options.root,
  })
end

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<c-p>",
      function()
        require("telescope.builtin").find_files(no_preview())
      end,
      desc = "Find Files from root",
    },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<esc>"] = function(...)
            return require("telescope.actions").close(...)
          end,
          ["<C-j>"] = function(...)
            return require("telescope.actions").move_selection_next(...)
          end,
          ["<C-k>"] = function(...)
            return require("telescope.actions").move_selection_previous(...)
          end,
        },
      },
    },
  },
}
