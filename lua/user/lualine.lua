require('lualine').setup {
  options = {
    icons_enable = true,
    globalstatus = true,
    theme = 'auto',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename', 'diagnostics'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  }
}
