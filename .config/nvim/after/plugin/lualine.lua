require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'material',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
    -- Available components
    -- branch:      git branch
    -- buffers:     available buffers
    -- diagnostics: diagnostics count
    -- diff:        git diff status
    -- encoding:    file encoding
    -- fileformat
    -- filename
    -- filesize
    -- filetype
    -- hostname
    -- location:    location in the current file - format:(line:column)
    -- mode:        vim mode
    -- progress:    %progress in the current file
    -- searchcount: number of search matches (hlsearch - active)
    -- tabs:        available tabs
    -- windows:     available windows

  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
