--- Get the server configuration for a given language server to be provided to the server's `setup()` call
--- @param server_name string The name of the server
--- @return table # The table of LSP options used when setting up the given language server
local config_opts = function(server_name)
  local opts = { capabilities = require("plugins.configs.lsp.basic.capability").capabilities }

  local user_on_attach = opts.on_attach
  opts.on_attach = function(client, bufnr)
    require("plugins.configs.lsp.basic.on-attach").on_attach(client, bufnr)
    utils.conditional_func(user_on_attach, true, client, bufnr)
  end
  return opts
end

--- Looks to see if a module path references a lua file in a configuration folder and tries to load it. If there is an error loading the file, write an error and continue
---@param module string The module path to try and load
---@return table|nil # The loaded module if successful or nil
local function load_lsp_config_file(module)
  -- placeholder for final return value
  local found_module = nil
  -- search through each of the supported configuration locations
  local lsp_config_path = vim.fn.stdpath "config"
  -- convert the module path to a file path (example user.init -> user/init.lua)
  local module_path = lsp_config_path .. "/lua/plugins/configs/lsp/custom/" .. module:gsub("%.", "/") .. ".lua"
  -- check if there is a readable file, if so, set it as found
  if vim.fn.filereadable(module_path) == 1 then
    found_module = module_path
  end

  -- if we found a readable lua file, try to load it
  if found_module then
    -- try to load the file
    local status_ok, loaded_module = pcall(require, module)
    -- if successful at loading, set the return variable
    if status_ok then
      found_module = loaded_module
      -- if unsuccessful, throw an error
    else
      vim.api.nvim_err_writeln("Error loading file: " .. found_module .. "\n\n" .. loaded_module)
    end
  end
  -- return the loaded module or nil if no file found
  return found_module
end

--- Helper function to set up a given server with the Neovim LSP client
--- @param server string The name of the server to be setup
local setup_server = function(server)
  -- if server doesn't exist, set it up from user server definition
  local config_avail, config = pcall(require, "lspconfig.server_configurations." .. server)
  if not config_avail or not config.default_config then
    local server_definition = load_lsp_config_file(server)
    if server_definition.cmd then require("lspconfig.configs")[server] = { default_config = server_definition } end
  end

  -- setup handler
  local opts = config_opts(server)
  if setup_handler then setup_handler(server, opts) end
end

--- setup servers that needs to be manually configured, like 
---     * custom LSP like AMZ barium
return function()
  vim.tbl_map(setup_server, {})
  vim.api.nvim_exec_autocmds("FileType", {})
  require("core.utils").event "LspSetup"
end


