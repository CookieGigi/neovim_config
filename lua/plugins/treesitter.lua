return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  keys = {
    -- Open/Close folds
    { "zo", "zo", desc = "Open fold under cursor" },
    { "zO", "zO", desc = "Open all folds under cursor recursively" },
    { "zc", "zc", desc = "Close fold under cursor" },
    { "zC", "zC", desc = "Close all folds under cursor recursively" },
    { "za", "za", desc = "Toggle fold under cursor" },
    { "zA", "zA", desc = "Toggle all folds under cursor recursively" },

    -- Fold levels
    { "zr", "zr", desc = "Reduce folding (open one level)" },
    { "zR", "zR", desc = "Open all folds" },
    { "zm", "zm", desc = "Fold more (close one level)" },
    { "zM", "zM", desc = "Close all folds" },

    -- Fold navigation
    { "zj", "zj", desc = "Move to next fold" },
    { "zk", "zk", desc = "Move to previous fold" },
    { "[z", "[z", desc = "Move to start of current fold" },
    { "]z", "]z", desc = "Move to end of current fold" },

    -- View and update
    { "zv", "zv", desc = "View cursor line (open folds to reveal)" },
    { "zx", "zx", desc = "Update folds" },
    { "zX", "zX", desc = "Undo manual folds" },

    -- Toggle folding
    { "zi", "zi", desc = "Toggle foldenable" },
  },
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
  end,
}
