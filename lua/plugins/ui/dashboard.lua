local lazy = require("lazy")

-- ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░▒▓████████▓▒░▒▓████████▓▒░
-- ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓████▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
-- ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░    ░▒▓██▓▒░░▒▓█▓▒░░▒▓█▓▒░
-- ░▒▓███████▓▒░░▒▓████████▓▒░  ░▒▓█▓▒░  ░▒▓██▓▒░  ░▒▓█▓▒░░▒▓█▓▒░
-- ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓██▓▒░    ░▒▓█▓▒░░▒▓█▓▒░
-- ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░  ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░
-- ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░  ░▒▓█▓▒░▒▓████████▓▒░▒▓████████▓▒░

return {
  {
    "folke/snacks.nvim",
    opts = {
      ---@class snacks.dashboard.Config
      dashboard = {
        width = 60,
        row = nil, -- dashboard position. nil for center
        col = nil, -- dashboard position. nil for center
        pane_gap = 4, -- empty columns between vertical panes
        autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
        -- These settings are used by some built-in sections
        preset = {
          -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
          ---@type fun(cmd:string, opts:table)|nil
          pick = nil,
          -- Used by the `keys` section to show keymaps.
          -- Set your custom keymaps here.
          -- When using a function, the `items` argument are the default keymaps.
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
          -- Used by the `header` section
          header = [[
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░▒▓████████▓▒░▒▓████████▓▒░
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓████▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░    ░▒▓██▓▒░░▒▓█▓▒░░▒▓█▓▒░
░▒▓███████▓▒░░▒▓████████▓▒░  ░▒▓█▓▒░  ░▒▓██▓▒░  ░▒▓█▓▒░░▒▓█▓▒░
░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓██▓▒░    ░▒▓█▓▒░░▒▓█▓▒░
░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░  ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░
░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░  ░▒▓█▓▒░▒▓████████▓▒░▒▓████████▓▒░
          ]],
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          {
            pane = 2,
            section = "terminal",
            cmd = "",
            icon = " ",
          },
          {
            pane = 2,
            icon = " ",
            title = "Recent Files",
            section = "recent_files",
            indent = 2,
            padding = 1,
          },
          {
            pane = 2,
            icon = " ",
            title = "Projects",
            section = "projects",
            indent = 3,
            padding = 1,
          },
          -- Git
          {
            pane = 2,
            icon = " ",
            desc = "Browse Git",
            padding = 1,
            key = "b",
            action = function()
              Snacks.gitbrowse()
            end,
          },
          function()
            local in_git = Snacks.git.get_root() ~= nil
            local cmds = {
              {
                icon = " ",
                title = "Git Status",
                cmd = "git status --short --branch --renames",
                height = 10,
              },
            }
            return vim.tbl_map(function(cmd)
              return vim.tbl_extend("force", {
                pane = 2,
                section = "terminal",
                enabled = in_git,
                padding = 1,
                ttl = 5 * 60,
                indent = 3,
              }, cmd)
            end, cmds)
          end,
          { section = "startup" },
        },
      },
    },
  },
}
