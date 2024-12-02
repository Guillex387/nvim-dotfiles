local keymap = function (map, func)
  vim.keymap.set('n', map.key, func, { desc = map.desc })
end

vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

require('nvim-tree').setup {
  filters = { dotfiles = false },
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    width = 30,
    preserve_window_proportions = true,
  },
  renderer = {
    root_folder_label = false,
    highlight_git = true,
    indent_markers = {
      enable = false,
      inline_arrows = false,
    },
    icons = {
      git_placement = "after",
      glyphs = {
        git = {
          unstaged = "U",
          staged = "S",
          unmerged = "UM",
          renamed = "R",
          deleted = "D",
          untracked = "UT",
          ignored = "I",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
  },
  git = {
    ignore = false,
  },
}

local api = require 'nvim-tree.api'
local nt_maps = require('user.config.keymaps').nvim_tree

keymap(nt_maps.toggle, api.tree.toggle)
keymap(nt_maps.cd, api.tree.change_root_to_node)
