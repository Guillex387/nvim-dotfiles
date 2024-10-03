local l_maps = require('user.config.keymaps').lsp
local servers = require 'user.config.lsp-servers'

local on_attach = function(client, buffer)
  client.server_capabilities.document_formatting = false
  local keymap = function(map, func)
    vim.keymap.set('n', map.key, func, { buffer = buffer, desc = map.desc })
  end
  keymap(l_maps.rename, vim.lsp.buf.rename)
  keymap(l_maps.code_action, vim.lsp.buf.code_action)
  keymap(l_maps.definition, vim.lsp.buf.definition)
  keymap(l_maps.implementation, vim.lsp.buf.implementation)
  keymap(l_maps.type, vim.lsp.buf.type_definition)
  keymap(l_maps.symbols, require('telescope.builtin').lsp_dynamic_workspace_symbols)
  keymap(l_maps.documentation, vim.lsp.buf.hover)
  keymap(l_maps.format, vim.lsp.buf.format)
  keymap(l_maps.diagnostic, vim.diagnostic.open_float)
end

require('mason').setup {}

local mason_lspconfig = require 'mason-lspconfig'

local server_names = {}
for server, _ in pairs(servers) do
  table.insert(server_names, server)
end

mason_lspconfig.setup {
  ensure_installed = server_names
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
mason_lspconfig.setup_handlers {
  function(server_name)
    local opts = {
      capabilities = capabilities,
      on_attach = on_attach
    }
    if servers[server_name] then
      opts = vim.tbl_deep_extend("force", servers[server_name], opts)
    end
    require('lspconfig')[server_name].setup(opts);
  end
}
