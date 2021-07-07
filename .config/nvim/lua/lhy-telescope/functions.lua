local themes = require "telescope.themes"

local drop_list = themes.get_dropdown {
  winblend = 20,
  previewer = false,
  hidden = true,
}

local M = {}

function M.edit_neovim()
  require("telescope.builtin").fd {
    prompt_title = "|> ::foonv:: <|",
    shorten_path = false,
    cwd = "~/.config/nvim",
    width = 0.25,
    -- layout_strategy = 'horizontal',
  }
end

function M.edit_zsh()
  require("telescope.builtin").fd {
    shorten_path = false,
    cwd = "~/.dotfiles/zshrc",
    prompt = "|> ::zdots:: <| ",
    -- layout_strategy = 'horizontal',
  }
end

function M.edit_dots()
  require("telescope.builtin").fd {
    shorten_path = false,
    cwd = "~/.dotfiles",
    prompt = "|> ::dotfiles:: <| ",
    -- layout_strategy = 'horizontal',
  }
end

function M.nvim_runtime()
  require("telescope.builtin").fd {
    prompt_title = "|> ::nvim runtime:: <|",
    shorten_path = false,
    cwd = "~/.local/share/nvim",
    width = 0.50,
    -- layout_strategy = 'horizontal',
  }
end

function M.fd_home()
  require("telescope.builtin").fd {
    prompt_title = "♾️  HOME ♾️ ",
    cwd = "~/",
    theme = drop_list,
  }
end

-- see builtin.fd.opts
function M.fd()
  require("telescope.builtin").fd()
end

function M.builtin()
  require("telescope.builtin").builtin(drop_list)
end

function M.buf_fuzzy()
  require("telescope.builtin").current_buffer_fuzzy_find(drop_list)
end

function M.git_files()
  require("telescope.builtin").git_files(drop_list)
end

function M.lsp_code_actions()
  require("telescope.builtin").lsp_code_actions(drop_list)
end

function M.live_grep()
  require("telescope.builtin").live_grep {
    shorten_path = true,
  }
end

function M.grep_prompt()
  require("telescope.builtin").grep_string {
    shorten_path = true,
    search = vim.fn.input "Grep String > ",
  }
end

function M.oldfiles()
  if pcall(require("telescope").load_extension, "frecency") then
    require("telescope").extensions.frecency.frecency()
  else
    require("telescope.builtin").oldfiles { layout_strategy = "vertical" }
  end
end

function M.staged_search()
  require("telescope").extensions.fzf_writer.staged_grep()
end

function M.project_search()
  require("telescope.builtin").find_files(drop_list) --{
  --   previewer = false,
  --   layout_strategy = "vertical",
  --   cwd = require('lspconfig').util.root_pattern(".git")(vim.fn.expand("%:p")),
  --   theme = drop_list,
  -- }
end

return M
