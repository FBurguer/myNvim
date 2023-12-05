    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")
    
    local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
    if not mason_null_ls_status then
      return
    end

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver",
      -- "html",
      -- "cssls",
      -- "tailwindcss",
        "lua_ls", 
      -- "pyright",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_null_ls_status({
      ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
      }
    })
 
