---@diagnostic disable: undefined-global
-- Formatter configuration using conform.nvim
-- Required external dependencies:
-- - stylua (install via cargo install stylua or system package manager)
-- - prettier (install via npm install -g prettier)

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
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

    -- Note: Format keymap is defined in lua/config/keymaps.lua as <leader>cf
    -- under the "Code" category, and also set up in the LspAttach autocmd
  end,
}
