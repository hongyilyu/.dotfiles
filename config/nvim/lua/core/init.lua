-- Credit: https://github.com/glepnir/dope/blob/main/lua/core/init.lua

local fn = vim.fn
local helper = require('core.helper')
-- remove check is windows because I only use mac or linux
local cache_dir = helper.path_join(vim.fn.stdpath('cache'), 'nvim')

-- Create cache dir and subs dir
local createdir = function()
  local data_dir = {
    cache_dir .. 'backup',
    cache_dir .. 'session',
    cache_dir .. 'swap',
    cache_dir .. 'tags',
    cache_dir .. 'undo',
  }
  -- There only check once that If cache_dir exists
  -- Then I don't want to check subs dir exists
  if fn.isdirectory(cache_dir) == 0 then
    os.execute('mkdir -p ' .. cache_dir)
    for _, v in pairs(data_dir) do
      if fn.isdirectory(v) == 0 then
        os.execute('mkdir -p ' .. v)
      end
    end
  end
end

createdir()

require('core.basic')
require('core.keymap')
require('core.autocmd')
require('core.pack'):boot_strap()
