return {
  -- 1. Package Manager for LSPs
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- 2. Bridge between Mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        -- Automatically install these servers if not present
        ensure_installed = { "lua_ls", "pyright", "ts_ls" }, 
      })
    end,
  },
  -- 3. Built-in LSP Configurations
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")
      -- Tell your LSP to pass capabilities to your completion engine
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Setup individual servers downloaded via Mason
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({ capabilities = capabilities })
    end,
  },
  -- 4. The Autocompletion Engine Menu
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Tells nvim-cmp to read LSP data
      "L3MON4D3/LuaSnip",     -- Snippet engine requirement
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }, -- Bring in the server data managed by Mason
        }),
      })
    end,
  }
}

