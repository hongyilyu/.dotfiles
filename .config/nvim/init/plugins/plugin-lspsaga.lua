local plugins = {
	-- LspSaga
    DiagnosticError =                       { fg = 'error' },
    DiagnosticWarning =                     { fg = 'yellow' },
    DiagnosticInformation =                 { fg = 'paleblue' },
    DiagnosticHint =                        { fg = 'purple' },
    DiagnosticTruncateLine =                { fg = 'fg' },
    LspFloatWinNormal =                     { bg = 'contrast' },
    LspFloatWinBorder =                     { fg = 'purple' },
    LspSagaBorderTitle =                    { fg = 'cyan' },
    LspSagaHoverBorder =                    { fg = 'paleblue' },
    LspSagaRenameBorder =                   { fg = 'green' },
    LspSagaDefPreviewBorder =               { fg = 'green' },
    LspSagaCodeActionBorder =               { fg = 'blue' },
    LspSagaFinderSelection =                { fg = 'green' },
    LspSagaCodeActionTitle =                { fg = 'paleblue' },
    LspSagaCodeActionContent =              { fg = 'purple' },
    LspSagaSignatureHelpBorder =            { fg = 'pink' },
    ReferencesCount =                       { fg = 'purple' },
    DefinitionCount =                       { fg = 'purple' },
    DefinitionIcon =                        { fg = 'blue' },
    ReferencesIcon =                        { fg = 'blue' },
    TargetWord =                            { fg = 'cyan' },
}


local highlight = function (group, color)
    local style = color.style and "gui=" .. color.style or "gui=NONE"
    local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
    local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
    local sp = color.sp and "guisp=" .. color.sp or ""

    local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

    vim.cmd(hl)
    if color.link then vim.cmd("highlight! link " .. group .. " " .. color.link) end
end

for group, colors in pairs(plugins) do
    highlight(group, colors)
end
