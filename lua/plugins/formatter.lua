---@diagnostic disable: undefined-global
-- Formatter configuration using conform.nvim
-- Required external dependencies:
-- - stylua (install via cargo install stylua or system package manager)
-- - prettier (install via npm install -g prettier)

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end,
      mode = { "n", "v" },
      desc = "Format file or selection",
    },
  },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "biome" },
        jsonc = { "biome" },
        markdown = { "prettier" },
      },
      format_on_save = {
        -- Enable format on save (set to false to disable)
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end,
}
