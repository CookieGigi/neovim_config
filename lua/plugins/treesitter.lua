return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    -- install
    require("nvim-treesitter").install({
      "comment",
      "diff",
      "editorconfig",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "json",
      "lua",
      "luadoc",
      "make",
      "markdown",
      "markdown_inline",
      "query",
      "regex",
      "toml",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "zsh",
    })

    -- fold
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

    local augroup = vim.api.nvim_create_augroup("open_folds", { clear = true })

    vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
      group = augroup,
      pattern = "*",
      callback = function()
        vim.cmd("normal zR")
      end,
      desc = "Open all folds when opening a file",
    })

    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
}
