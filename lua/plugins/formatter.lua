---@diagnostic disable: undefined-global
-- Formatter configuration using conform.nvim
-- Required external dependency: stylua (install via cargo install stylua or system package manager)

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
      },
      format_on_save = {
        -- Enable format on save (set to false to disable)
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })

    -- Manual format keymap
    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or selection" })
  end,
}
