---@diagnostic disable: undefined-global
-- which-key.nvim: displays a popup with possible keybindings

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    preset = "modern",
    delay = 300,
    icons = {
      mappings = true,
      keys = {},
    },
    win = {
      border = "rounded",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Document existing key groups
    wk.add({
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code" },
      { "<leader>d", group = "Diagnostics" },
      { "<leader>e", desc = "Open file explorer" },
      { "<leader>E", desc = "Open explorer in split" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP/Location" },
      { "<leader>q", group = "Quickfix" },
      { "<leader>r", group = "Rename" },
      { "<leader>s", group = "Search/Split" },
      { "<leader>t", group = "Tabs/Toggle" },
      { "<leader>tm", group = "Tab Move" },
      { "<leader>w", group = "Workspace/Window" },
      { "[", group = "Previous" },
      { "]", group = "Next" },
    })
  end,
}
