return {
  "aznhe21/actions-preview.nvim",
  dependencies = { "folke/snacks.nvim" },
  event = "LspAttach", -- Lazy load when LSP attaches
  opts = {
    backend = { "snacks" }, -- Use Snacks picker as backend
    diff = {
      algorithm = "patience",
      ignore_whitespace = true,
    },
    snacks = {
      -- Snacks picker will handle the UI
      -- Inherits existing Snacks picker configuration
    },
  },
  config = function(_, opts)
    require("actions-preview").setup(opts)
  end,
}
