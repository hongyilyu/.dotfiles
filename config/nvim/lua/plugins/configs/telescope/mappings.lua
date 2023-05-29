local sectionF = { desc = require("core.utils").get_icon("Search", 1, true) .. "  Find" }

local maps = { n = {} }

maps.n["f"] = sectionF
maps.n["f'"] = { function() require("telescope.builtin").marks() end, "Find marks" }
maps.n["fb"] = { function() require("telescope.builtin").buffers() end, "Find buffers" }
maps.n["fc"] =
  { function() require("telescope.builtin").grep_string() end, "Find for word under cursor" }
maps.n["fC"] = { function() require("telescope.builtin").commands() end, "Find commands" }
maps.n["ff"] = { function() require("telescope.builtin").find_files() end, "Find files" }
maps.n["fF"] = {
  function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
  "Find all files",
}
maps.n["fh"] = { function() require("telescope.builtin").help_tags() end, "Find help" }
maps.n["fk"] = { function() require("telescope.builtin").keymaps() end, "Find keymaps" }
maps.n["fm"] = { function() require("telescope.builtin").man_pages() end, "Find man" }
maps.n["fo"] = { function() require("telescope.builtin").oldfiles() end, "Find history" }
maps.n["fr"] = { function() require("telescope.builtin").registers() end, "Find registers" }
maps.n["fw"] = { function() require("telescope.builtin").live_grep() end, "Find words" }
maps.n["fW"] = {
    function()
      require("telescope.builtin").live_grep {
        additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
      }
    end,
    "Find words in all files",
  }

maps.n["lD"] = { function() require("telescope.builtin").diagnostics() end, "Search diagnostics" }

return maps
