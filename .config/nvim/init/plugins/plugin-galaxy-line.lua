-- require'nvim-web-devicons'.setup()

local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local fileinfo = require('galaxyline.provider_fileinfo')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista'}

local all_trim = function(s)
   return s:match( "^%s*(.-)%s*$" )
end

local Set = function(list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

local ignore_file_name = Set {'NvimTree', '__vista__'}

local colors = {
  bg = '#282c34',
  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#608B4E',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#d16d9e',
  grey = '#c0c0c0',
  blue = '#569CD6',
  red = '#D16969'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local buffer_name_not_in_short_line = function()
	if ignore_file_name[all_trim(fileinfo.get_current_file_name())] then
		return false
	end
	return buffer_not_empty()
end

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = colors.purple, 
                          i = colors.green,
                          v = colors.blue,
                          [''] = colors.blue,
                          V = colors.blue,
                          c = colors.purple,
                          no = colors.magenta,
                          s = colors.orange,
                          S = colors.orange,
                          [''] = colors.orange,
                          ic = colors.yellow,
                          R = colors.red,
                          Rv = colors.red,
                          cv = colors.red,
                          ce=colors.red, 
                          r = colors.cyan,
                          rm = colors.cyan, 
                          ['r?'] = colors.cyan,
                          ['!']  = colors.red,
                          t = colors.red}
      vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[vim.fn.mode()])
      -- auto change mode display according the vim mode
      local mode_name = {n = 'NORMAL', 
                          i = 'INSERT',
                          v = 'VISUAL',
                          [''] = 'V-BLOCK',
                          V = 'V-LINE',
                          c = 'COMMAND',
                          no = 'OP PENDING',
                          s = 'SELECT',
                          S = 'S-LINE',
                          [''] = 'S-BLOCK',
                          ic = 'INSERT COMPL',
                          R = 'REPLACE',
                          Rv = 'V REPLACE',
                          t = 'TERMINAL'}
      return '  '..mode_name[vim.fn.mode()]..' '
    end,
    separator = ' ',
    separator_highlight = {colors.yellow,function()
      if not buffer_not_empty() then
        return colors.bg
      end
      return colors.bg
    end},
    highlight = {colors.grey,colors.bg,'bold'},
  },
}

gls.left[3] = {
 GitIcon = {
        provider = function()
            return ' '
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.orange, colors.bg}
    }
}
gls.left[4] = {
 GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    -- separator = ' ',
    -- separator_highlight = {colors.purple,colors.bg},
    icon = ' ',
    highlight = {colors.green,colors.bg},
  }
}
gls.left[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    -- separator = ' ',
    -- separator_highlight = {colors.purple,colors.bg},
    icon = '~',
    highlight = {colors.blue,colors.bg},
  }
}
gls.left[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    -- separator = ' ',
    -- separator_highlight = {colors.purple,colors.bg},
    icon = ' ',
    highlight = {colors.red,colors.bg},
  }
}
gls.left[8] = {
  GitSeparator = {
    provider = function() return ' ' end,
    separator = '| ',
    separator_highlight = {colors.darkblue,colors.bg},
    highlight = {colors.purple,colors.bg}
  }
}

local FilePath = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return vim.fn.expand('%')
  end
  return vim.fn.pathshorten(vim.fn.expand('%'))
end
gls.left[9] = {
  FileName = {
    provider = FilePath,
    condition = buffer_not_empty,
    highlight = {colors.grey,colors.bg},
  }
}

gls.left[10] = {
  Vista = {
    provider = 'VistaPlugin',
    condition = buffer_not_empty,
    highlight = {colors.grey,colors.bg},
  }
}

gls.right[1] = {
    DiagnosticError = {provider = 'DiagnosticError', icon = ' ', highlight = {colors.error_red, colors.bg}}
}
gls.right[2] = {DiagnosticWarn = {provider = 'DiagnosticWarn', icon = ' ', highlight = {colors.orange, colors.bg}}}

gls.right[5]= {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = {colors.bg,colors.bg},
    highlight = {colors.grey,colors.bg},
  }
}
gls.right[6]= {
  LineIcon = {
    provider = function() return ' ' end,
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.bg},
    highlight = {colors.grey,colors.bg},
  }
}
gls.right[7] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = '',
    separator_highlight = {colors.darkblue,colors.bg},
    highlight = {colors.grey,colors.bg},
  },
}
gls.right[8] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' |',
    separator_highlight = {colors.darkblue,colors.bg},
    highlight = {colors.grey,colors.bg},
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.grey,colors.purple}
  }
}
gls.short_line_left[3] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = buffer_name_not_in_short_line,
    highlight = {colors.orange,colors.bg},
  }
}
gls.short_line_left[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = buffer_name_not_in_short_line,
    highlight = {colors.grey,colors.bg},
  }
}
gls.short_line_left[9] = {
  FileName = {
    provider = 'FileName',
    condition = buffer_name_not_in_short_line,
    highlight = {colors.grey,colors.bg},
  }
}
