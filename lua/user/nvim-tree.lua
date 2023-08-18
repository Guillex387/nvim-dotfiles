local keymap = function (map, func)
  vim.keymap.set('n', map.key, func, { desc = map.desc })
end

vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

require('nvim-tree').setup {
  disable_netrw = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  reload_on_bufenter = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  diagnostics = {
    enable = true
  }
}

local api = require 'nvim-tree.api'
local nt_maps = require('user.config.keymaps').nvim_tree

keymap(nt_maps.toggle, api.tree.toggle)
keymap(nt_maps.cd, api.tree.change_root_to_node)
