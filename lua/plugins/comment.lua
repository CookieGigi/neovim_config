---@diagnostic disable: undefined-global
-- Comment.nvim - Smart and powerful commenting plugin
-- Supports treesitter, line/block comments, motions, and text objects
--
-- No external dependencies required
--
-- Default keymaps configured:
--   NORMAL mode:
--     gcc - Toggle line comment
--     gbc - Toggle block comment
--     gc{motion} - Toggle line comment (e.g., gcip, gc$, gcw)
--     gb{motion} - Toggle block comment (e.g., gbaf, gbac)
--     gco - Insert comment below and enter INSERT mode
--     gcO - Insert comment above and enter INSERT mode
--     gcA - Insert comment at end of line and enter INSERT mode
--
--   VISUAL mode:
--     gc - Toggle line comment
--     gb - Toggle block comment

return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    -- Line comment toggle
    { "gcc", mode = "n", desc = "Toggle line comment" },
    { "gc", mode = { "n", "v" }, desc = "Toggle line comment" },

    -- Block comment toggle
    { "gbc", mode = "n", desc = "Toggle block comment" },
    { "gb", mode = { "n", "v" }, desc = "Toggle block comment" },

    -- Extra comment operations
    { "gco", mode = "n", desc = "Add comment below" },
    { "gcO", mode = "n", desc = "Add comment above" },
    { "gcA", mode = "n", desc = "Add comment at end of line" },
  },
  config = function()
    require("Comment").setup({
      -- Add a space between comment and the line
      padding = true,

      -- Whether the cursor should stay at its position
      sticky = true,

      -- Lines to be ignored while (un)comment
      ignore = nil,

      -- LHS of toggle mappings in NORMAL mode
      toggler = {
        line = "gcc",
        block = "gbc",
      },

      -- LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        line = "gc",
        block = "gb",
      },

      -- LHS of extra mappings
      extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
      },

      -- Enable keybindings
      mappings = {
        basic = true,
        extra = true,
      },

      -- Function to call before (un)comment
      pre_hook = nil,

      -- Function to call after (un)comment
      post_hook = nil,
    })
  end,
}
