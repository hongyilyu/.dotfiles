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
local mappings = {
  ["e"] = { ":e <C-R>=expand('%:p:h') . '/' <CR>", "New file nearby" },
  ["r"] = { "<cmd>lua require('custom.reverse')()<CR>", "Reverse Toggle" },
  ["/"] = { "<cmd>lua require('custom.comment')()<CR>", "Comment Toggle" },
}
which_key.register(mappings, opts)

local other_opts = {
  mode = "n", -- NORMAL mode
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local other_mappings = {
}
which_key.register(other_mappings, other_opts)
