local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local utils = require "core.utils"

--------------------------------------------------------------------------------------
--Credit: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/autocmds.lua
--------------------------------------------------------------------------------------
autocmd({ "BufReadPost", "BufNewFile" }, {
  group = augroup("file_user_events", { clear = true }),
  callback = function(args)
    if not (vim.fn.expand "%" == "" or vim.api.nvim_get_option_value("buftype", { buf = args.buf }) == "nofile") then
      utils.event "File"
      if utils.cmd("git -C \"" .. vim.fn.expand "%:p:h" .. "\" rev-parse", false) then
        utils.event "GitFile"
      end
    end
  end,
})

--------------------------------------------------------------------------------------
--------------------------------------- MISC -----------------------------------------
--------------------------------------------------------------------------------------

-- Highlight on yank
autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {}
  end,
  group = augroup("YankHighlight", { clear = true }),
})

-- Disable comment new line
autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove { "c", "r", "o" }
  end,
})

autocmd("BufRead,BufNewFile", {
  pattern = "tsconfig.json",
  callback = function()
    vim.opt.filetype = "jsonc"
  end,
})

autocmd("CmdwinEnter", {
  desc = "Quit Cmdline buffer",
  pattern = "*",
  callback = function()
    vim.cmd.quit()
  end,
})

-- Open file at location that was last viewed
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    vim.cmd [[
        if line("'\"") > 1 && line("'\"") <= line("$") |
            exe "normal! g`\"" |
        endif
        ]]
  end,
})

--------------------------------------------------------------------------------------
--------------------------------------- MISC -----------------------------------------
--------------------------------------------------------------------------------------

if utils.is_available "alpha-nvim" then
  local group_name = augroup("alpha_settings", { clear = true })
  autocmd("User", {
    desc = "Disable status and tablines for alpha",
    group = group_name,
    pattern = "AlphaReady",
    callback = function()
      local prev_showtabline = vim.opt.showtabline
      local prev_status = vim.opt.laststatus
      vim.opt.laststatus = 0
      vim.opt.showtabline = 0
      vim.opt_local.winbar = nil
      autocmd("BufUnload", {
        pattern = "<buffer>",
        callback = function()
          vim.opt.laststatus = prev_status
          vim.opt.showtabline = prev_showtabline
        end,
      })
    end,
  })
  autocmd("VimEnter", {
    desc = "Start Alpha when vim is opened with no arguments",
    group = group_name,
    callback = function()
      local should_skip = false
      if vim.fn.argc() > 0 or vim.fn.line2byte "$" ~= -1 or not vim.o.modifiable then
        should_skip = true
      else
        for _, arg in pairs(vim.v.argv) do
          if arg == "-b" or arg == "-c" or vim.startswith(arg, "+") or arg == "-S" then
            should_skip = true
            break
          end
        end
      end
      if not should_skip then
        require("alpha").start(true)
      end
    end,
  })
end
