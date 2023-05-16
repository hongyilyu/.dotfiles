local M = {}

-----------------------------------------------------------------------------------------
-- Credit: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/utils/init.lua
-----------------------------------------------------------------------------------------

--- Merge extended options with a default table of options
---@param default? table The default table that you want to merge into
---@param opts? table The new options that should be merged with the default table
---@return table # The merged table
function M.extend_tbl(default, opts)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

--- Run a shell command and capture the output and if the command succeeded or failed
---@param cmd string The terminal command to execute
---@param show_error? boolean Whether or not to show an unsuccessful command as an error to the user
---@return string|nil # The result of a successfully executed command or nil
function M.cmd(cmd, show_error)
  local wind32_cmd
  if vim.fn.has "win32" == 1 then
    wind32_cmd = { "cmd.exe", "/C", cmd }
  end
  local result = vim.fn.system(wind32_cmd or cmd)
  local success = vim.api.nvim_get_vvar "shell_error" == 0
  if not success and (show_error == nil or show_error) then
    vim.api.nvim_err_writeln("Error running command: " .. cmd .. "\nError message:\n" .. result)
  end
  return success and result:gsub("[\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", "") or nil
end

--- Serve a notification with a title of LHY-iS-Learning
---@param msg string The notification body
---@param type number|nil The type of the notification (:help vim.log.levels)
---@param opts? table The nvim-notify options to use (:help notify-options)
function M.notify(msg, type, opts)
  vim.schedule(function()
    vim.notify(msg, type, M.extend_tbl({ title = "LHY-iS-Learning" }, opts))
  end)
end

--- Open a URL under the cursor with the current operating system
---@param path string The path of the file to open with the system opener
function M.system_open(path)
  local cmd
  if vim.fn.has "win32" == 1 and vim.fn.executable "explorer" == 1 then
    cmd = { "cmd.exe", "/K", "explorer" }
  elseif vim.fn.has "unix" == 1 and vim.fn.executable "xdg-open" == 1 then
    cmd = { "xdg-open" }
  elseif (vim.fn.has "mac" == 1 or vim.fn.has "unix" == 1) and vim.fn.executable "open" == 1 then
    cmd = { "open" }
  end
  if not cmd then
    M.notify("Available system opening tool not found!", vim.log.levels.ERROR)
  end
  vim.fn.jobstart(vim.fn.extend(cmd, { path or vim.fn.expand "<cfile>" }), { detach = true })
end

--- Trigger an user event
---@param event string The event name to be appended to LHY
function M.event(event)
  vim.schedule(function()
    vim.api.nvim_exec_autocmds("User", { pattern = "LHY_" .. event })
  end)
end

--- Get an icon from `lspkind` if it is available and return it
---@param kind string The kind of icon in `lspkind` to retrieve
---@return string icon
function M.get_icon(kind)
  if not M.icons then
    M.icons = require "core.icons"
  end
  return M.icons and M.icons[kind] or ""
end

--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yet
---@param plugin string The plugin to search for
---@return boolean available # Whether the plugin is available
function M.is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end

--- Call function if a condition is met
---@param func function The function to run
---@param condition boolean # Whether to run the function or not
---@return any|nil result # the result of the function running or nil
function M.conditional_func(func, condition, ...)
  -- if the condition is true or no condition is provided, evaluate the function with the rest of the parameters and return the result
  if condition and type(func) == "function" then
    return func(...)
  end
end

-----------------------------------------------------------------------------------------
-- Source: https://github.com/simrat39/dotfiles/blob/master/nvim/.config/nvim/lua/mappings.lua
-----------------------------------------------------------------------------------------

function M.Set(list)
  local set = {}
  for _, l in ipairs(list) do
    set[l] = true
  end
  return set
end

function M.nnoremap(lhs, rhs, silent)
  if not silent then
    silent = true
  end
  vim.keymap.set("n", lhs, rhs, { noremap = true, silent = silent })
end

function M.inoremap(lhs, rhs)
  vim.keymap.set("i", lhs, rhs, { noremap = true })
end

function M.vnoremap(lhs, rhs, silent)
  if not silent then
    silent = true
  end
  vim.keymap.set("v", lhs, rhs, { noremap = true, silent = silent })
end

function M.cnoremap(lhs, rhs)
  vim.keymap.set("c", lhs, rhs, { noremap = true })
end

return M
