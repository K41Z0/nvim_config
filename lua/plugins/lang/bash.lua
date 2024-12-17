local tablelib = require("utils.table")

return {
  -- Ensure Bash treesitter is installed
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      tablelib.insert(opts.ensure_installed, "bash")
    end,
  },

  -- Ensure Bash debugger is installed
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      tablelib.insert(opts.ensure_installed, "bash")
    end,
  },

  -- Correctly setup lspconfig for Bashs
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
      },
      settings = {
        bashls = {},
      },
    },
  },
}
