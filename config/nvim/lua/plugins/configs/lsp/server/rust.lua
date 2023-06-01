local adapter = function()
  local success, package = pcall(function()
    return require("mason-registry").get_package "codelldb"
  end)
  if success then
    local package_path = package:get_install_path()
    local codelldb_path = package_path .. "/codelldb"
    local liblldb_path = package_path .. "/extension/lldb/lib/liblldb"
    local this_os = vim.loop.os_uname().sysname

    -- The path in windows is different
    if this_os:find "Windows" then
      codelldb_path = package_path .. "\\extension\\adapter\\codelldb.exe"
      liblldb_path = package_path .. "\\extension\\lldb\\bin\\liblldb.dll"
    else
      -- The liblldb extension is .so for linux and .dylib for macOS
      liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
    end
    return require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
  else
    return require("rust-tools.dap").get_codelldb_adapter()
  end
end

return {
  tools = {
    executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
    reload_workspace_from_cargo_toml = true,
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      only_current_line = false,
      show_parameter_hints = false,
      parameter_hints_prefix = "<-",
      other_hints_prefix = "=>",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "Comment",
    },
    hover_actions = {
      border = "rounded",
    },
    on_initialized = function()
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
        pattern = { "*.rs" },
        callback = function()
          local _, _ = pcall(vim.lsp.codelens.refresh)
        end,
      })
    end,
  },
  server = {
    on_attach = require("plugins.configs.lsp.basic.on-attach").on_attach,
    capabilities = require("plugins.configs.lsp.basic.capability").capabilities,
    settings = {
      ["rust-analyzer"] = {
        inlayHints = { locationLinks = false },
        lens = {
          enable = true,
        },
        checkOnSave = {
          enable = true,
          command = "clippy",
        },
      },
    },
  },
  dap = {
    adapter = adapter()
  }
}
