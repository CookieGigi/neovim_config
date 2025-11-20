---@diagnostic disable: undefined-global, undefined-field
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    animate = {
      enabled = true,
      duration = 20,
      easing = "inOutQuad",
      fps = 120,
    },
    bigfile = { enabled = true },
    dim = {
      enabled = true,
      scope = {
        min_size = 5,
        max_size = 20,
        siblings = true,
      },
      animate = {
        enabled = true,
        easing = "outQuad",
        duration = {
          step = 20,
          total = 300,
        },
      },
    },
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return require("snacks").git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
    explorer = { enabled = false },
    gh = { enabled = true },
    gitbrowse = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    keymap = { enabled = true },
    lazygit = {
      configure = true,
      config = {
        os = { editPreset = "nvim-remote" },
        gui = {
          nerdFontsVersion = "3",
        },
      },
      theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
      theme = {
        [241] = { fg = "Special" },
        activeBorderColor = { fg = "MatchParen", bold = true },
        cherryPickedCommitBgColor = { fg = "Identifier" },
        cherryPickedCommitFgColor = { fg = "Function" },
        defaultFgColor = { fg = "Normal" },
        inactiveBorderColor = { fg = "FloatBorder" },
        optionsTextColor = { fg = "Function" },
        searchingActiveBorderColor = { fg = "MatchParen", bold = true },
        selectedLineBgColor = { bg = "Visual" },
        unstagedChangesColor = { fg = "DiagnosticError" },
      },
      win = {
        style = "lazygit",
      },
    },
    picker = {
      enabled = true,
      -- Default confirm action opens in tab
      confirm = "tab",
      win = {
        input = {
          keys = {
            -- <CR> opens in new tab (default)
            ["<cr>"] = { "tab", mode = { "n", "i" } },
            -- <C-e> opens in current buffer (override)
            ["<c-e>"] = { "confirm", mode = { "n", "i" } },
          },
        },
        list = {
          keys = {
            -- <CR> opens in new tab (default)
            ["<cr>"] = "tab",
            -- <C-e> opens in current buffer (override)
            ["<c-e>"] = "confirm",
          },
        },
      },
    },
    notifier = {
      enabled = true,
      timeout = 3000,
      width = { min = 40, max = 0.4 },
      height = { min = 1, max = 0.6 },
      margin = { top = 0, right = 1, bottom = 0 },
      padding = true,
      gap = 0,
      sort = { "level", "added" },
      level = vim.log.levels.TRACE,
      icons = {
        error = " ",
        warn = " ",
        info = " ",
        debug = " ",
        trace = " ",
      },
      keep = function(notif)
        return vim.fn.getcmdpos() > 0
      end,
      style = "compact",
      top_down = true,
      date_format = "%R",
      more_format = " ↓ %d lines ",
      refresh = 50,
    },
    quickfile = { enabled = true },
    rename = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    scratch = {
      enabled = true,
      win = {
        wo = {
          foldenable = false,
          foldmethod = "manual",
        },
      },
    },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    -- Top Pickers
    {
      "<leader><space>",
      function()
        require("snacks").picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>,",
      function()
        require("snacks").picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>/",
      function()
        require("snacks").picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>:",
      function()
        require("snacks").picker.command_history()
      end,
      desc = "Command History",
    },

    -- Find
    {
      "<leader>fb",
      function()
        require("snacks").picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fc",
      function()
        require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Config File",
    },
    {
      "<leader>ff",
      function()
        require("snacks").picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fg",
      function()
        require("snacks").picker.git_files()
      end,
      desc = "Find Git Files",
    },
    {
      "<leader>fp",
      function()
        require("snacks").picker.projects()
      end,
      desc = "Projects",
    },
    {
      "<leader>fr",
      function()
        require("snacks").picker.recent()
      end,
      desc = "Recent",
    },

    -- Git
    {
      "<leader>gb",
      function()
        require("snacks").picker.git_branches()
      end,
      desc = "Git Branches",
    },
    {
      "<leader>gB",
      function()
        require("snacks").git.blame_line()
      end,
      desc = "Git Blame Line",
    },
    {
      "<leader>gg",
      function()
        require("snacks").lazygit.open()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gL",
      function()
        require("snacks").lazygit.log()
      end,
      desc = "Lazygit Log",
    },
    {
      "<leader>gF",
      function()
        require("snacks").lazygit.log_file()
      end,
      desc = "Lazygit Log File",
    },
    {
      "<leader>gc",
      function()
        require("snacks").picker.git_log()
      end,
      desc = "Git Log (Commits)",
    },
    {
      "<leader>gd",
      function()
        require("snacks").picker.git_diff()
      end,
      desc = "Git Diff (Hunks)",
    },
    {
      "<leader>gf",
      function()
        require("snacks").picker.git_log_file()
      end,
      desc = "Git Log File",
    },
    {
      "<leader>gl",
      function()
        require("snacks").picker.git_log_line()
      end,
      desc = "Git Log Line",
    },
    {
      "<leader>go",
      function()
        require("snacks").gitbrowse.open()
      end,
      desc = "Open in Browser",
    },
    {
      "<leader>gs",
      function()
        require("snacks").picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>gS",
      function()
        require("snacks").picker.git_stash()
      end,
      desc = "Git Stash",
    },

    -- GitHub (moved to <leader>gh prefix for clarity)
    {
      "<leader>ghi",
      function()
        require("snacks").picker.gh_issue()
      end,
      desc = "GitHub Issues (open)",
    },
    {
      "<leader>ghI",
      function()
        require("snacks").picker.gh_issue({ state = "all" })
      end,
      desc = "GitHub Issues (all)",
    },
    {
      "<leader>ghp",
      function()
        require("snacks").picker.gh_pr()
      end,
      desc = "GitHub Pull Requests (open)",
    },
    {
      "<leader>ghP",
      function()
        require("snacks").picker.gh_pr({ state = "all" })
      end,
      desc = "GitHub Pull Requests (all)",
    },

    -- Search
    {
      "<leader>sb",
      function()
        require("snacks").picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sB",
      function()
        require("snacks").picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>sg",
      function()
        require("snacks").picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>sw",
      function()
        require("snacks").picker.grep_word()
      end,
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },
    {
      "<leader>sc",
      function()
        require("snacks").picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sC",
      function()
        require("snacks").picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sd",
      function()
        require("snacks").picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>sD",
      function()
        require("snacks").picker.diagnostics_buffer()
      end,
      desc = "Buffer Diagnostics",
    },
    {
      "<leader>sh",
      function()
        require("snacks").picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>sH",
      function()
        require("snacks").picker.highlights()
      end,
      desc = "Highlights",
    },
    {
      "<leader>sk",
      function()
        require("snacks").picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sm",
      function()
        require("snacks").picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>sM",
      function()
        require("snacks").picker.man()
      end,
      desc = "Man Pages",
    },
    {
      "<leader>sq",
      function()
        require("snacks").picker.qflist()
      end,
      desc = "Quickfix List",
    },
    {
      "<leader>sR",
      function()
        require("snacks").picker.resume()
      end,
      desc = "Resume",
    },
    {
      "<leader>su",
      function()
        require("snacks").picker.undo()
      end,
      desc = "Undo History",
    },

    -- LSP
    {
      "gd",
      function()
        require("snacks").picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gD",
      function()
        require("snacks").picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "gr",
      function()
        require("snacks").picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        require("snacks").picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        require("snacks").picker.lsp_type_definitions()
      end,
      desc = "Goto Type Definition",
    },
    {
      "<leader>ls",
      function()
        require("snacks").picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },

    -- Notifications
    {
      "<leader>nd",
      function()
        require("snacks").notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<leader>nh",
      function()
        require("snacks").notifier.show_history()
      end,
      desc = "Notification History",
    },

    -- Scratch Buffers
    {
      "<leader>vt",
      function()
        require("snacks").scratch({
          name = "TODO",
          ft = "markdown",
          template = "# TODO\n\n## High Priority\n\n- [ ] \n\n## Medium Priority\n\n## Low Priority\n\n",
          filekey = { id = "todo", cwd = false, branch = false, count = false },
        })
      end,
      desc = "TODO Scratch Buffer",
    },
    {
      "<leader>vn",
      function()
        require("snacks").scratch({
          name = "Notes",
          ft = "markdown",
          template = "# Notes - " .. os.date("%Y-%m-%d") .. "\n\n",
          filekey = { id = "notes", cwd = false, branch = false, count = false },
        })
      end,
      desc = "Notes Scratch Buffer",
    },
    {
      "<leader>vs",
      function()
        require("snacks").scratch({
          name = "Snippets",
          ft = function()
            return vim.bo.filetype ~= "" and vim.bo.filetype or "text"
          end,
          filekey = { id = "snippets", cwd = false, branch = false, count = false },
        })
      end,
      desc = "Snippets Scratch Buffer",
    },
    {
      "<leader>vq",
      function()
        require("snacks").scratch({
          name = "SQL",
          ft = "sql",
          template = "-- SQL Scratch\n\nSELECT \nFROM \nWHERE \n",
          filekey = { id = "sql", cwd = false, branch = false, count = false },
        })
      end,
      desc = "SQL Scratch Buffer",
    },
    {
      "<leader>vc",
      function()
        require("snacks").scratch({
          name = "Calc",
          ft = "lua",
          template = "-- Quick calculations (press <CR> to execute)\nreturn ",
          filekey = { id = "calc", cwd = false, branch = false, count = false },
        })
      end,
      desc = "Calculation Scratch Buffer",
    },
    {
      "<leader>vj",
      function()
        require("snacks").scratch({
          name = "Journal",
          ft = "markdown",
          template = "# Dev Journal - "
            .. os.date("%Y-%m-%d %A")
            .. "\n\n## What I worked on\n\n## Problems solved\n\n## Questions/TODO\n\n",
          filekey = {
            id = "journal-" .. os.date("%Y-%m-%d"),
            cwd = false,
            branch = false,
            count = false,
          },
        })
      end,
      desc = "Daily Journal Scratch Buffer",
    },
    {
      "<leader>vr",
      function()
        require("snacks").scratch({
          name = "Regex",
          ft = "lua",
          template = '-- Regex Tester (press <CR> to execute)\nlocal pattern = ""\nlocal text = ""\nreturn text:match(pattern)\n',
          filekey = { id = "regex", cwd = false, branch = false, count = false },
        })
      end,
      desc = "Regex Tester Scratch Buffer",
    },
    {
      "<leader>vf",
      function()
        local win = require("snacks").scratch({
          name = "JSON",
          ft = "json",
          template = "{}",
          filekey = { id = "json", cwd = false, branch = false, count = false },
          win = {
            keys = {
              ["format"] = {
                "<leader>j",
                function(self)
                  -- Get all buffer content
                  local lines = vim.api.nvim_buf_get_lines(self.buf, 0, -1, false)
                  local content = table.concat(lines, "\n")

                  -- Try to parse and format JSON
                  local ok, decoded = pcall(vim.json.decode, content)
                  if ok then
                    local formatted = vim.fn.json_encode(decoded)
                    -- Pretty print with jq if available, otherwise use vim's indent
                    local jq_result = vim.fn.system("jq .", formatted)
                    if vim.v.shell_error == 0 then
                      local new_lines = vim.split(jq_result, "\n")
                      vim.api.nvim_buf_set_lines(self.buf, 0, -1, false, new_lines)
                    else
                      -- Fallback: use vim's json formatting
                      local new_lines = vim.split(formatted, "\n")
                      vim.api.nvim_buf_set_lines(self.buf, 0, -1, false, new_lines)
                      vim.cmd("normal! gg=G")
                    end
                    vim.notify("JSON formatted successfully", vim.log.levels.INFO)
                  else
                    vim.notify("Invalid JSON: " .. tostring(decoded), vim.log.levels.ERROR)
                  end
                end,
                desc = "Format JSON",
                mode = "n",
              },
            },
          },
        })
      end,
      desc = "JSON Formatter Scratch Buffer",
    },
    {
      "<leader>v.",
      function()
        require("snacks").scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>vv",
      function()
        require("snacks").scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
  },
  config = function(_, opts)
    local snacks = require("snacks")
    snacks.setup(opts)

    -- Override vim.notify to use Snacks notifier
    vim.notify = snacks.notifier

    -- Enable dim globally after setup
    snacks.dim.enable()
  end,
}
