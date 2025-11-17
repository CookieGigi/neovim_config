---@diagnostic disable: undefined-global
-- Linter configuration using ALE (Asynchronous Lint Engine)
-- Required external dependency: biome (install via npm install -g @biomejs/biome)

return {
  "dense-analysis/ale",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Linters by filetype
    vim.g.ale_linters = {
      json = { "biome" },
      jsonc = { "biome" },
    }

    -- Fixers by filetype
    vim.g.ale_fixers = {
      json = { "biome" },
      jsonc = { "biome" },
    }

    -- General settings
    vim.g.ale_fix_on_save = 0
    vim.g.ale_lint_on_save = 1
    vim.g.ale_lint_on_insert_leave = 1
    vim.g.ale_lint_on_text_changed = "never"
  end,
  keys = {
    { "<leader>lf", "<cmd>ALEFix<cr>", desc = "Fix with ALE" },
    { "<leader>ln", "<cmd>ALENext<cr>", desc = "Next ALE diagnostic" },
    { "<leader>lp", "<cmd>ALEPrevious<cr>", desc = "Previous ALE diagnostic" },
  },
}
