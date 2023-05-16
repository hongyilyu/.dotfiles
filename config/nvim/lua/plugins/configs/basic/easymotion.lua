return function(_, opts)
  vim.g.EasyMotion_smartcase = 1
  vim.cmd [[
        map  / <Plug>(easymotion-sn)
        omap / <Plug>(easymotion-tn)
    ]]
end
