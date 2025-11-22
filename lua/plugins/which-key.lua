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
      -- Top-level quick access
      { "<leader><space>", desc = "Smart find files" },
      { "<leader>,", desc = "Buffers picker" },
      { "<leader>/", desc = "Grep" },
      { "<leader>:", desc = "Command history" },

      -- File Operations
      { "<leader>e", desc = "Open file explorer in new tab" },
      { "<leader>E", desc = "Open file explorer in current window" },

      -- Buffer Management
      { "<leader>b", group = "Buffer" },

      -- Code Actions
      { "<leader>c", group = "Code" },
      { "<leader>k", desc = "Signature help" },

      -- Debug
      { "<leader>d", group = "Debug" },
      { "<leader>db", group = "Breakpoints" },
      { "<leader>ds", group = "Step" },

      -- Find/Files
      { "<leader>f", group = "Find/Files" },

      -- Git Operations
      { "<leader>g", group = "Git" },
      { "<leader>gh", group = "GitHub" },

      -- LSP
      { "<leader>l", group = "LSP" },

      -- Miscellaneous
      { "<leader>n", group = "Misc" },

      -- Clipboard
      { "<leader>p", desc = "Paste from system clipboard" },

      -- Quickfix & Location Lists / Quit
      { "<leader>q", group = "Quickfix/Lists/Quit" },
      { "<C-q>", desc = "Quit all" },

      -- Search
      { "<leader>s", group = "Search" },

      -- Tabs/Tests
      { "<leader>t", group = "Tabs/Tests" },
      { "<leader>tm", group = "Tab Move" },

      -- Scratch Buffers
      { "<leader>v", group = "Scratch Buffers" },

      -- Window/Split Management & Workspace
      { "<leader>w", group = "Window/Workspace" },

      -- Diagnostics
      { "<leader>x", group = "Diagnostics" },

      -- Clipboard
      { "<leader>y", desc = "Copy to system clipboard" },
      { "<leader>Y", desc = "Copy line to system clipboard" },

      -- Navigation prefixes
      { "[", group = "Previous" },
      { "]", group = "Next" },
      { "g", group = "Goto" },

      -- Comment Operations
      { "gc", group = "Comment" },
      { "gb", group = "Block Comment" },
    })
  end,
}
