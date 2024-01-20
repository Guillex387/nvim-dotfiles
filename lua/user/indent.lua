require("ibl").setup {
  indent = { char = "┊" },
  scope = { enabled = false },
}

local imaps = require('user.config.keymaps').indent

-- Visual keymap
local vkeymap = function (map, func)
  vim.cmd('vmap '..map.key..' '..func)
end

-- Keymaps for tab or "detab" a selection
vkeymap(imaps.vtab, '>gv')
vkeymap(imaps.vdetab, '<gv')
