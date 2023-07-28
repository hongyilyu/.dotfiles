-- Credit: https://github.com/glepnir/dope/blob/main/lua/core/init.lua

local fn = vim.fn

local path_join = function(...)
  return table.concat({ ... }, package.config:sub(1, 1) == "\\" and "\\" or "/")
end
-- remove check is windows because I only use mac or linux
local cache_dir = path_join(vim.fn.stdpath "cache", "nvim")

-- Create cache dir and subs dir
local createdir = function()
  local backup = cache_dir .. "backup"
  local swap = cache_dir .. "swap"
  local undo = cache_dir .. "undo"

  local data_dir = {
    backup,
    swap,
    undo,
  }

  -- There only check once that If cache_dir exists
  -- Then I don't want to check subs dir exists
  if fn.isdirectory(cache_dir) == 0 then
    os.execute("mkdir -p " .. cache_dir)
    for _, v in pairs(data_dir) do
      if fn.isdirectory(v) == 0 then
        os.execute("mkdir -p " .. v)
      end
    end
  end

  -- point directories
  local options = {
    dir = swap,
    undodir = undo, -- Permanent undo
    undofile = true,
    backupdir = backup,
  }

  for key, value in pairs(options) do
    vim.opt[key] = value
  end
end

createdir()
