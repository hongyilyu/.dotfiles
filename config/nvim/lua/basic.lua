vim.mapleader = ","
vim.g.mapleader = ","

local options = {
    --  Basic Config
    bs             = "eol,start,indent",        -- set backspace key mode set whichwrap+=<,>		 https://vim.fandom.com/wiki/Automatically_wrap_left_and_right
    hlsearch       = false,
    autoindent     = true,
    cindent        = true,                      -- C/C++ indentation
    breakindent    = true,                      -- enable indentation
    breakindentopt = "shift:4,sbr,min:10",      -- ident by an additional 4 characters on wrapped lines, when line >= 10 characters, put 'showbreak' at start of line
    showbreak      = "↪ ",                      -- wrap indent
    smartindent    = true,                      -- Smart Indent
    wrap           = false,                     -- display long lines as multiple line
    ttimeout       = true,                      -- Function Key timeout
    ttimeoutlen    = 50,                        -- Function Key timeout set to 50 ms
    ruler          = true,                      -- always show current position
    clipboard      = "unnamedplus",             -- https://stackoverflow.com/a/30691754/6780928
    lazyredraw     = true,
    undodir        = "/tmp/.nvimdid/",          -- Permanent undo
    undofile       = true,
    mouse          = "ic",

    --  Display Settings
    splitright     = true,                      -- default new window at right side when split
    splitbelow     = true,

    -- Indent Format
    tabstop        = 4,                         -- tab key width
    shiftwidth     = 4,                         -- indent width
    softtabstop    = 4,                         -- insert tabs on the start of line based on shiftwidth
    expandtab      = true,                      -- Always uses spaces instead of tab characters (et)

    -- Other Settings
    showmatch      = true,                      -- cursor shows matching ) and }
    matchtime      = 3,                         -- how many tens of second to blink when matching bracket
    display        = "lastline",                -- Show last line

    wildmenu       = true,                      -- wild char completion menu
    wildignore     = "*.o,*~,*.pyc",            -- ignore compiled files
    wildmode       = "list:longest",
    completeopt    = "menuone,noinsert,noselect",
    magic          = true,                      -- for regular expressions turn magic on

    title          = true,                      -- change terminal's title
    autoread       = true,                      -- auto reload file
    showcmd        = true,                      -- show command on status bar
    scrolloff      = 10,                        -- keep 10 lines when scrol down or up
    cursorline     = false,                     -- highlight current line
    mousehide      = true,                      -- hide the mouse when typing
    hid            = true,                      -- A buffer becomes hidden when it is abandoned

    ffs            = "unix,dos,mac",            -- default unix line-break
}

local options_plus = {
    shortmess      = "c",
    formatoptions  = "m",                       -- if text object Unicode > 255，wrap line before space.
    errorformat    = "[%f:%l] -> %m,[%f:%l]:%m",
}

for key, value in pairs(options) do
    vim.opt[key] = value
end

for key, value in pairs(options_plus) do
    vim.opt[key] = vim.opt[key] + value
end
