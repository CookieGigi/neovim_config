return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavors = "macchiato",
    integrations = {
      treesitter = true,
    },
  },
  config = function()
    vim.cmd.colorscheme("catppuccin-macchiato")
  end,
}
