local function comment()
  require("ts_context_commentstring.internal").update_commentstring()
  local mode = vim.fn.mode()
  if mode == "n" or mode =="v" then
    vim.fn.feedkeys("gcc")
  elseif mode == "V" then
    vim.fn.feedkeys("gbc")
  end
end

return comment
