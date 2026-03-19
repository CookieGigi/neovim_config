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

    -- Setup organize imports on save for TypeScript/JavaScript
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
      group = vim.api.nvim_create_augroup("OrganizeImports", { clear = true }),
      callback = function(args)
        local clients = vim.lsp.get_clients({ bufnr = args.buf, name = "ts_ls" })
        if #clients == 0 then
          return
        end

        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.organizeImports" },
            diagnostics = {},
          },
        })
      end,
    })

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
        timeout_ms = 1000,
        lsp_fallback = true,
      },
    })

    -- Note: Format keymap is defined in lua/config/keymaps.lua as <leader>cf
    -- under the "Code" category, and also set up in the LspAttach autocmd
  end,
}
