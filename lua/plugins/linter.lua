---@diagnostic disable: undefined-global
-- Linter configuration using ALE (Asynchronous Lint Engine)
-- Required external dependencies:
-- - biome (install via npm install -g @biomejs/biome)
-- - markdownlint-cli (install via npm install -g markdownlint-cli)
-- - prettier (install via npm install -g prettier)

return {
  "dense-analysis/ale",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Linters by filetype
    vim.g.ale_linters = {
      json = { "biome" },
      jsonc = { "biome" },
      markdown = { "markdownlint" },
    }

    -- Fixers by filetype
    vim.g.ale_fixers = {
      json = { "biome" },
      jsonc = { "biome" },
      markdown = { "markdownlint", "prettier" },
    }

    -- General settings
    vim.g.ale_fix_on_save = 0
    vim.g.ale_lint_on_save = 1
    vim.g.ale_lint_on_insert_leave = 1
    vim.g.ale_lint_on_text_changed = "never"
  end,
  keys = {
    { "<leader>xf", "<cmd>ALEFix<cr>", desc = "Fix with ALE" },
    { "<leader>xn", "<cmd>ALENext<cr>", desc = "Next ALE diagnostic" },
    { "<leader>xp", "<cmd>ALEPrevious<cr>", desc = "Previous ALE diagnostic" },
  },
}
