-- Source: https://github.com/whatsthatsmell/dots/blob/master/public%20dots/vim-nvim/lua/joel/funcs.lua

local utils = require "util"
local Job = require "plenary.job"

local M = {}
function M.create_todoist_task(opts)
    -- TODO: itself is a todo : )
end

function M.notify_current_datetime()
    local dt = vim.fn.strftime "%c"
    require "notify"("Current Date Time: " .. dt, "info", { title = "Date & Time" })
end

function M.yank_current_file_name()
    local file_name = vim.api.nvim_buf_get_name(0)
    local input_pipe = vim.loop.new_pipe(false)

    local yanker = Job:new {
        writer = input_pipe,
        command = "pbcopy",
    }

    -- TODO: This works perfectly but double-check if it could be better(less)
    yanker:start()
    input_pipe:write(file_name)
    input_pipe:close()
    yanker:shutdown()

    require "notify"("Yanked: " .. file_name, "info", { title = "File Name Yanker", timeout = 1000 })
end

-- clear nvim-notify notifications history
function M.clear_notification_history()
    local choice = vim.fn.confirm("Clear Notification History?", "&Yes\n&No\n&Cancel")
    if choice == 1 then
        R "notify"
        print "Notification History Cleared"
    else
        print "Notification History Remains"
    end
end

-- cliclick goodness
-- click notification banner. MacOS specific - 2560x1440
function M.click_banner_notification()
    local _ = utils.get_os_command_output({ "cliclick", "c:2525,30" }, "~")
    return _
end

-- cliclick -> move pointer off top Mac sys menu - MacOS specific - 2560x1440
-- most annoying issue in Big Sur!!!!
function M.move_pointer_off_menu()
    local _ = utils.get_os_command_output({ "cliclick", "m:1300,95" }, "~")
    return _
end
-- end of cliclick goodness

-- toggle boolean word - true/false
function M.toggle_bool(args)
    if args.word == "true" then
        vim.cmd [[norm ciwfalse]]
    elseif args.word == "false" then
        vim.cmd [[norm ciwtrue]]
    elseif args.word == "TRUE" then
        vim.cmd [[norm ciwFALSE]]
    elseif args.word == "FALSE" then
        vim.cmd [[norm ciwTRUE]]
    else
        print "Word under cursor needs to be 'true' or 'false"
    end
end

return M
