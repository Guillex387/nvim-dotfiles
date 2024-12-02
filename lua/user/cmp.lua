local cmp = require 'cmp'
local luasnip = require 'luasnip'

local icons = require('user.config.icons')
local cmp_maps = require('user.config.keymaps').cmp

cmp.setup {
  completion = { completeopt = "menu,menuone,preview,noselect" },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    [cmp_maps.scroll_down.key] = cmp.mapping.scroll_docs(-4),
    [cmp_maps.scroll_up.key] = cmp.mapping.scroll_docs(4),
    [cmp_maps.abort.key] = cmp.mapping.abort(),
    [cmp_maps.complete.key] = cmp.mapping.complete(),
    [cmp_maps.confirm.key] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    },
    [cmp_maps.next.key] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    [cmp_maps.prev.key] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    [cmp_maps.snip_next.key] = cmp.mapping(function (fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    [cmp_maps.snip_prev.key] = cmp.mapping(function (fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' })
  }),
  formatting = {
    expandable_indicator = true,
    fields = { 'kind', 'abbr', 'menu' },
    format = function(_, item)
      item.kind = string.format('%s %s', icons.kind[item.kind], item.kind)
      return item
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' }
  }
}

