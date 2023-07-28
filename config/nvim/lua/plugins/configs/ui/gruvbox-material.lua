return function(_, _)
  local colors = require("core.color").dark

  vim.g.background = "dark"
  vim.g.gruvbox_material_background = "hard"
  vim.g.gruvbox_material_sign_column_background = "clear"
  vim.o.signcolumn = "yes:2"

  if not vim.api.nvim_get_option "termguicolors" then
    vim.o.termguicolors = true
  end

  -- custom highlights
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.bg3 })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = colors.none })

  vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.bg5, fg = colors.green })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.bg3, fg = colors.fg0 })
  -- Sbar fg does not take effect...
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.bg9, fg = colors.grey2 })
  vim.api.nvim_set_hl(0, "PMenuThumb", { fg = colors.aqua })

  -- LSPSaga
  --      General
  vim.api.nvim_set_hl(0, "SagaBorder", { fg = colors.grey1, bg = colors.bg3 })
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red, bg = colors.none })
  vim.api.nvim_set_hl(0, "DiagnosticWarning", { fg = colors.yellow, bg = colors.none })
  vim.api.nvim_set_hl(0, "DiagnosticInformation", { fg = colors.blue, bg = colors.none })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.green, bg = colors.none })
  --     CodeAction
  vim.api.nvim_set_hl(0, "CodeActionBorder", { fg = colors.purple, bg = colors.none })
  vim.api.nvim_set_hl(0, "CodeActionText", { fg = colors.fg0, bg = colors.none })
  vim.api.nvim_set_hl(0, "CodeActionNumber", { fg = colors.dimRed, bg = colors.none })
  --      Rename
  vim.api.nvim_set_hl(0, "RenameBorder", { fg = colors.purple, bg = colors.none })
  vim.api.nvim_set_hl(0, "RenameNormal", { fg = colors.blue, bg = colors.none })
  --      Diagnostic
  vim.api.nvim_set_hl(0, "DiagnosticBorder", { fg = colors.purple, bg = colors.none })

  vim.cmd [[colorscheme gruvbox-material]]
end
