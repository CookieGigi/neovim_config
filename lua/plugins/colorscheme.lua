return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavors = "macchiato",
    integrations = {
      which_key = true,
      treesitter = true,
    },
  },
  config = function()
    vim.cmd.colorscheme("catppuccin-macchiato")
  end,
}
