---@diagnostic disable: undefined-global
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Python test adapter
    "nvim-neotest/neotest-python",
  },
  keys = {
    -- Test execution
    { "<leader>tt", function() require("neotest").run.run() end, desc = "Run nearest test" },
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run current file" },
    { "<leader>ta", function() require("neotest").run.run(vim.fn.getcwd()) end, desc = "Run all tests" },
    { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run last test" },
    { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug nearest test" },

    -- Test control
    { "<leader>ts", function() require("neotest").run.stop() end, desc = "Stop nearest test" },
    { "<leader>tA", function() require("neotest").run.attach() end, desc = "Attach to nearest test" },

    -- Test watching
    { "<leader>tw", function() require("neotest").watch.toggle() end, desc = "Toggle watch nearest test" },
    { "<leader>tW", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle watch file" },

    -- Test output
    { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Show test output" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle output panel" },

    -- Test summary
    { "<leader>tS", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },

    -- Test navigation
    { "[t", function() require("neotest").jump.prev({ status = "failed" }) end, desc = "Jump to previous failed test" },
    { "]t", function() require("neotest").jump.next({ status = "failed" }) end, desc = "Jump to next failed test" },
  },
  config = function()
    require("neotest").setup({
      -- Adapters
      adapters = {
        require("neotest-python")({
          -- Use debugpy for debugging tests
          dap = { justMyCode = false },
          -- Test runner (pytest or unittest)
          runner = "pytest",
          -- Python interpreter (defaults to system python or virtualenv)
          python = function()
            local venv = os.getenv("VIRTUAL_ENV")
            if venv then
              return venv .. "/bin/python"
            end
            return "python"
          end,
          -- pytest arguments
          args = { "--log-level", "DEBUG", "--quiet" },
          -- Discover pytest tests
          pytest_discover_instances = true,
        }),
      },

      -- Discovery
      discovery = {
        enabled = true,
        concurrent = 1,
      },

      -- Running tests
      running = {
        concurrent = true,
      },

      -- Default strategy for running tests
      default_strategy = "integrated",

      -- Log level
      log_level = vim.log.levels.WARN,

      -- Notifications
      consumers = {},

      -- Icons (using codicons - compatible with most terminals)
      icons = {
        collapsed = "",
        expanded = "",
        child_prefix = "",
        child_indent = "",
        final_child_prefix = "",
        non_collapsible = "",
        collapsed_open = "",
        expanded_open = "",
        unknown = "",
        passed = "",
        running = "",
        failed = "",
        skipped = "",
        watching = "",
      },

      -- Floating window options
      floating = {
        border = "rounded",
        max_height = 0.9,
        max_width = 0.9,
        options = {},
      },

      -- Highlights
      highlights = {
        adapter_name = "NeotestAdapterName",
        border = "NeotestBorder",
        dir = "NeotestDir",
        expand_marker = "NeotestExpandMarker",
        failed = "NeotestFailed",
        file = "NeotestFile",
        focused = "NeotestFocused",
        indent = "NeotestIndent",
        marked = "NeotestMarked",
        namespace = "NeotestNamespace",
        passed = "NeotestPassed",
        running = "NeotestRunning",
        select_win = "NeotestWinSelect",
        skipped = "NeotestSkipped",
        target = "NeotestTarget",
        test = "NeotestTest",
        unknown = "NeotestUnknown",
        watching = "NeotestWatching",
      },

      -- Output panel
      output_panel = {
        enabled = true,
        open = "botright split | resize 15",
      },

      -- Quickfix
      quickfix = {
        enabled = true,
        open = false,
      },

      -- Status signs
      status = {
        enabled = true,
        signs = true,
        virtual_text = false,
      },

      -- Strategies
      strategies = {
        integrated = {
          height = 40,
          width = 120,
        },
      },

      -- Summary window
      summary = {
        enabled = true,
        animated = true,
        follow = true,
        expand_errors = true,
        open = "botright vsplit | vertical resize 50",
        mappings = {
          attach = "a",
          clear_marked = "M",
          clear_target = "T",
          debug = "d",
          debug_marked = "D",
          expand = { "<CR>", "<2-LeftMouse>" },
          expand_all = "e",
          jumpto = "i",
          mark = "m",
          next_failed = "J",
          output = "o",
          prev_failed = "K",
          run = "r",
          run_marked = "R",
          short = "O",
          stop = "s",
          target = "t",
          watch = "w",
        },
      },

      -- Diagnostic messages
      diagnostic = {
        enabled = true,
        severity = vim.diagnostic.severity.ERROR,
      },
    })
  end,
}
