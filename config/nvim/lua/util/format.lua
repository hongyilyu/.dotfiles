local M = {}

---@class LazyFormatter
---@field name string
---@field primary? boolean
---@field format fun(bufnr:number)
---@field sources fun(bufnr:number):string[]
---@field priority number
M.formatters = {} ---@type LazyFormatter[]

---@param formatter LazyFormatter
function M.register(formatter)
  M.formatters[#M.formatters + 1] = formatter
  table.sort(M.formatters, function(a, b)
    return a.priority > b.priority
  end)
end

function M.setup()
  -- Manual format
  vim.api.nvim_create_user_command("Format", function()
      require("conform").format({ async = true, lsp_fallback = true })
  end, { desc = "Format selection or buffer" })
  vim.api.nvim_create_user_command("FOrmat", function()
      require("conform").format({ async = true, lsp_fallback = true })
  end, { desc = "Format selection or buffer" })
end

return M
