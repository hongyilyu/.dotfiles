local dap = require('dap')
local hint = [[
     ^ ^Step^ ^ ^      ^ ^     Action         
 ----^-^-^-^--^-^----  ^-^-------------------  
     ^ ^back^ ^ ^     ^_b_: toggle breakpoint 
     ^ ^ _K_^ ^        _B_: clear breakpoints 
 out _H_ ^ ^ _L_ into  _c_: continue          
     ^ ^ _J_ ^ ^       _x_: terminate         
     ^ ^over ^ ^     ^^_r_: open repl         

     ^ ^  _q_: exit
]]
require('hydra') {
  name = 'Debug',
  hint = hint,
  config = {
    color = 'pink',
    invoke_on_body = true,
    hint = {
      type = 'window'
    },
  },
  mode = { 'n' },
  body = '<leader>d',
  heads = {
    { 'H', dap.step_out,{ desc = 'step out' } },
    { 'J', dap.step_over, { desc = 'step over' } },
    { 'K', dap.step_back, { desc = 'step back' } },
    { 'L', dap.step_into, { desc = 'step into' } },
    { 'b', dap.toggle_breakpoint, { desc = 'toggle breakpoint' } },
    { 'B', dap.clear_breakpoints, { desc = 'clear breakpoints' } },
    { 'c', dap.continue, { desc = 'continue' } },
    { 'x', dap.terminate, { desc = 'terminate' } },
    { 'r', dap.repl.open, { exit = true, desc = 'open repl' } },
    { 'q', nil, { exit = true, nowait = true, desc = 'exit' } },
  }
}
