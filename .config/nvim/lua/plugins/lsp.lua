return {
	{
	    "mason-org/mason-lspconfig.nvim",
	    opts = {},
	    dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	    },
	},
	{
		"neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Ensure mason and mason-lspconfig are loaded in the correct order
      require("mason").setup()
      
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      mason_lspconfig.setup({
        -- Optional: You can still force-install specific servers here
        ensure_installed = { "pyright", "ruff", "lua_ls" },
        
        -- THIS IS THE MAGIC BIT:
        -- Dynamic handlers automatically setup ANY server installed via Mason
        handlers = {
          -- The first entry with no key is the default handler
          function(server_name)
            lspconfig[server_name].setup({})
          end,

          -- Optional: You can override settings for specific servers if needed
          -- ["pyright"] = function()
          --   lspconfig.pyright.setup({
          --     settings = { python = { analysis = { autoSearchPaths = true } } }
          --   })
          -- end,
        },
      })
    end,
	}

}
