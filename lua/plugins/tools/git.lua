local table_utils = require("utils.table")

return {
  recommended = {
    ft = {
      "gitcommit",
      "gitconfig",
      "gitrebase",
      "gitignore",
      "gitattributes",
    },
  },

  -- Treesitter git support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table_utils.insert(opts.ensure_installed, {
        "git_config",
        "gitcommit",
        "git_rebase",
        "gitignore",
        "gitattributes",
      })
    end,
  },

  {
    "nvim-cmp",
    dependencies = {
      {
        "petertriho/cmp-git",
        opts = {},
      },
    },
    ---@module 'cmp'
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table_utils.insert(opts.sources, { name = "git" })
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}
