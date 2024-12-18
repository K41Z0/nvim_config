local table_utils = require("utils.table")

return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "json", "jsonc", "json5" },
      root = { "*.json" },
    })
  end,

  -- add json to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table_utils.insert(opts.ensure_installed, { "json5" })
    end,
  },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        jsonls = {
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            local json_schemas = require("schemastore").json.schemas()
            table_utils.insert(new_config.settings.json.schemas, json_schemas)
          end,
          settings = {
            json = {
              format = {
                enable = true,
              },
              validate = { enable = true },
            },
          },
        },
      },
    },
  },
}
