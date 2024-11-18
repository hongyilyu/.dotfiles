local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  if opts.remap and not vim.g.vscode then
    opts.remap = nil
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("i", "<C-a>", "<home>", { expr = false, silent = true })
map("i", "<C-e>", "<end>", { expr = false, silent = true })

map("i", "<C-n>", "<down>", { expr = false, silent = true })
map("i", "<C-p>", "<up>", { expr = false, silent = true })
map("i", "<C-f>", "<right>", { expr = false, silent = true })
map("i", "<C-b>", "<left>", { expr = false, silent = true })

-- Mapping in coding.lua file
-- map("i", "<S-Tab>", "<c-d>", { expr = false, silent = true })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- ----------------------------------------------------------------------
-- Use ALT + hjkl to resize windows
-- ----------------------------------------------------------------------
map("n", "<M-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<M-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<M-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<M-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- ----------------------------------------------------------------------
-- Use ALT + hjkl to move lines
-- ----------------------------------------------------------------------
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- ----------------------------------------------------------------------
--  cmd line mode easy navigation
-- ----------------------------------------------------------------------
map("c", "<c-h>", "<left>")
map("c", "<c-j>", "<down>")
map("c", "<c-k>", "<up>")
map("c", "<c-l>", "<right>")
map("c", "<c-a>", "<home>")
map("c", "<c-e>", "<end>")
map("c", "<c-f>", "<c-d>")
map("c", "<c-b>", "<left>")
map("c", "<c-d>", "<del>")
map("c", "<c-_>", "<c-k>")

-- ----------------------------------------------------------------------
-- Undo break points
-- ----------------------------------------------------------------------
map({ "i", "n", "o" }, ",", ",<c-g>u")
map({ "i", "n", "o" }, ".", ".<c-g>u")
map({ "i", "n", "o" }, "!", "!<c-g>u")
map({ "i", "n", "o" }, "?", "?<c-g>u")
map({ "i", "n", "o" }, "[", "[<c-g>u")
map({ "i", "n", "o" }, "'", "'<c-g>u")
map({ "i", "n", "o" }, '"', '"<c-g>u')

-- ----------------------------------------------------------------------
-- buffers
-- ----------------------------------------------------------------------
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- ----------------------------------------------------------------------
-- Clear search with <esc>
-- ----------------------------------------------------------------------
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- ----------------------------------------------------------------------
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- ----------------------------------------------------------------------
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- ----------------------------------------------------------------------
-- better indenting
-- ----------------------------------------------------------------------
map("v", "<", "<gv")
map("v", ">", ">gv")

-- ----------------------------------------------------------------------
-- Plugins
-- ----------------------------------------------------------------------
map("n", "<C-n>", "<cmd>lua require('neo-tree.command').execute({ toggle = true, dir = LazyVim.root() })<CR>", {desc = "File Explorer", remap = true})
map("n", "<leader>e", ":e <C-R>=expand('%:p:h') . '/' <CR>", {desc = "New File Nearby"})

-- ----------------------------------------------------------------------
-- Bufferline
-- ----------------------------------------------------------------------
map("n", "<leader>1", "<cmd>lua require('bufferline').go_to_buffer(1, true)<CR>", { desc = "which_key_ignore" })
map("n", "<leader>2", "<cmd>lua require('bufferline').go_to_buffer(2, true)<CR>", { desc = "which_key_ignore" })
map("n", "<leader>3", "<cmd>lua require('bufferline').go_to_buffer(3, true)<CR>", { desc = "which_key_ignore" })
map("n", "<leader>4", "<cmd>lua require('bufferline').go_to_buffer(4, true)<CR>", { desc = "which_key_ignore" })
map("n", "<leader>5", "<cmd>lua require('bufferline').go_to_buffer(5, true)<CR>", { desc = "which_key_ignore" })
map("n", "<leader>6", "<cmd>lua require('bufferline').go_to_buffer(6, true)<CR>", { desc = "which_key_ignore" })
map("n", "<leader>7", "<cmd>lua require('bufferline').go_to_buffer(7, true)<CR>", { desc = "which_key_ignore" })
map("n", "<leader>8", "<cmd>lua require('bufferline').go_to_buffer(8, true)<CR>", { desc = "which_key_ignore" })
map("n", "<leader>9", "<cmd>lua require('bufferline').go_to_buffer(9, true)<CR>", { desc = "which_key_ignore" })
