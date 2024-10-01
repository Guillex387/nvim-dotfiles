local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
					  [vim.fn.stdpath("config") .. "/lua"] = true
          }
        }
      }
    }
  },
  clangd = {},
  gopls = {},
  rust_analyzer = {
    cargo = {
      allFeatures = true
    }
  }
}

return servers
