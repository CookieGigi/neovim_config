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
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP" },
      { "<leader>r", group = "Rename" },
      { "<leader>s", group = "Search/Split" },
      { "<leader>t", group = "Toggle" },
      { "<leader>w", group = "Workspace/Window" },
    })
  end,
}
