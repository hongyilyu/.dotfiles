local merge = require("core.utils").extend_tbl

local telescope = require("plugins.configs.telescope.mappings").n

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
  ["/"] = { "<cmd>lua require('custom.comment')()<CR>", "Comment Out" },
  ["r"] = { "<cmd>lua require('custom.reverse')()<CR>", "Reverse Toggle" },
}
mappings = merge(mappings, telescope)
which_key.register(mappings, opts)

local other_opts = {
  mode = "n", -- NORMAL mode
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local other_mappings = {
  ["<c-n>"] = { ":NvimTreeToggle<CR>", "File Explorer" },
  ["<c-p>"] = { "<cmd>lua require('plugins.configs.telescope.finder').ctrl_p()<CR>", "File Search" },
}
which_key.register(other_mappings, other_opts)
