-- Credit: https://github.com/glepnir/dope/blob/main/lua/core/init.lua

local fn = vim.fn

local path_join = function(...)
  return table.concat({ ... }, package.config:sub(1, 1) == "\\" and "\\" or "/")
end
-- remove check is windows because I only use mac or linux
local cache_dir = path_join(vim.fn.stdpath("cache"), "nvim")

-- Create cache dir and subs dir
local createdir = function()
  local data_dir = {
    cache_dir .. "backup",
    cache_dir .. "session",
    cache_dir .. "swap",
    cache_dir .. "tags",
    cache_dir .. "undo",
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
    swapfile = false,
    directory = cache_dir .. 'swap/',
    undodir = cache_dir .. 'undo/',  -- Permanent undo
    backupdir = cache_dir .. 'backup/',
    undofile = true,
  }

  for key, value in pairs(options) do
    vim.opt[key] = value
  end
end

createdir()
