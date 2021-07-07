local map_tele = function(key, f, options, buffer)
  local mode = "n"
  local rhs = string.format(
    "<cmd>lua require('config.telescope')['%s'](%s)<CR>",
    f,
    options and vim.inspect(options, { newline = "" }) or ""
  )
  local options = {
    noremap = true,
    silent = true,
  }

  if not buffer then
    vim.api.nvim_set_keymap(mode, key, rhs, options)
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, options)
  end
end

vim.api.nvim_set_keymap("c", "<c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true })

-- Files
map_tele("<c-p>", "project_search")
map_tele("<leader>fh", "fd_home")
map_tele("<leader>fg", "live_grep")
map_tele("<leader>fd", "fd")

map_tele("<leader>ft", "treesitter")
map_tele("<leader>fw", "grep_string", { short_path = true, word_match = "-w" })

return map_tele
