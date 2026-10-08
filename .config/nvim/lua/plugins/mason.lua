return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason", -- Only load Mason when you run the :Mason command
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } }, -- Optional: Add a keymap to open it
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    },
  }
}

