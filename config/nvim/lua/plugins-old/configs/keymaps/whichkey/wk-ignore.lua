local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local ignore_mappings = {
  ["1"] = { "<cmd>lua require('bufferline').go_to_buffer(1, true)<CR>", "which_key_ignore" },
  ["2"] = { "<cmd>lua require('bufferline').go_to_buffer(2, true)<CR>", "which_key_ignore" },
  ["3"] = { "<cmd>lua require('bufferline').go_to_buffer(3, true)<CR>", "which_key_ignore" },
  ["4"] = { "<cmd>lua require('bufferline').go_to_buffer(4, true)<CR>", "which_key_ignore" },
  ["5"] = { "<cmd>lua require('bufferline').go_to_buffer(5, true)<CR>", "which_key_ignore" },
  ["6"] = { "<cmd>lua require('bufferline').go_to_buffer(6, true)<CR>", "which_key_ignore" },
  ["7"] = { "<cmd>lua require('bufferline').go_to_buffer(7, true)<CR>", "which_key_ignore" },
  ["8"] = { "<cmd>lua require('bufferline').go_to_buffer(8, true)<CR>", "which_key_ignore" },
  ["9"] = { "<cmd>lua require('bufferline').go_to_buffer(9, true)<CR>", "which_key_ignore" },
}

which_key.register(ignore_mappings, opts)
