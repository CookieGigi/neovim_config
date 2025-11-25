---@diagnostic disable: undefined-global
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- UI extension for better debugging experience
    {
      "rcarriga/nvim-dap-ui",
      dependencies = {
        "nvim-neotest/nvim-nio",
      },
    },
    -- Virtual text support for variable values
    "theHamsta/nvim-dap-virtual-text",
  },
  keys = {
    -- F-keys for quick debugging (standard IDE conventions)
    { "<F5>", function() require("dap").continue() end, desc = "Debug: Continue" },
    { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle breakpoint" },
    { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step over" },
    { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step into" },
    { "<F12>", function() require("dap").step_out() end, desc = "Debug: Step out" },

    -- Session control
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue/Start" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to cursor" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dr", function() require("dap").restart() end, desc = "Restart" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },

    -- Breakpoints
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Conditional breakpoint" },
    { "<leader>dL", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, desc = "Log point" },
    { "<leader>dbl", function() require("dap").list_breakpoints() end, desc = "List breakpoints" },
    { "<leader>dbx", function() require("dap").clear_breakpoints() end, desc = "Clear all breakpoints" },

    -- Stepping
    { "<leader>dso", function() require("dap").step_over() end, desc = "Step over" },
    { "<leader>dsi", function() require("dap").step_into() end, desc = "Step into" },
    { "<leader>dsu", function() require("dap").step_out() end, desc = "Step out" },
    { "<leader>dsb", function() require("dap").step_back() end, desc = "Step back" },
    { "<leader>dsr", function() require("dap").restart_frame() end, desc = "Restart frame" },

    -- UI
    { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle UI" },
    { "<leader>dU", function() require("dapui").open({ reset = true }) end, desc = "Reset UI" },

    -- Evaluation & REPL
    { "<leader>de", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>dE", function() require("dap").eval() end, desc = "Evaluate expression", mode = { "n", "v" } },
    { "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "Hover variables" },
    { "<leader>dw", function() require("dap.ui.widgets").preview() end, desc = "Preview variables" },

    -- Inspection
    { "<leader>di", function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes) end, desc = "Inspect scopes" },
    { "<leader>df", function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames) end, desc = "Show frames" },
    { "<leader>dT", function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").threads) end, desc = "Show threads" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- DAP UI setup
    dapui.setup({
      icons = { expanded = "", collapsed = "", current_frame = "" },
      controls = {
        icons = {
          pause = "",
          play = "",
          step_into = "",
          step_over = "",
          step_out = "",
          step_back = "",
          run_last = "",
          terminate = "",
          disconnect = "",
        },
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.40 },
            { id = "breakpoints", size = 0.20 },
            { id = "stacks", size = 0.20 },
            { id = "watches", size = 0.20 },
          },
          size = 50,
          position = "left",
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
          size = 15,
          position = "bottom",
        },
      },
      floating = {
        border = "rounded",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      render = {
        max_value_lines = 3,
      },
    })

    -- Virtual text setup
    require("nvim-dap-virtual-text").setup({
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = false,
      show_stop_reason = true,
      commented = false,
      only_first_definition = true,
      all_references = false,
      clear_on_continue = false,
      display_callback = function(variable, _buf, _stackframe, _node, options)
        if options.virt_text_pos == "inline" then
          return " = " .. variable.value
        else
          return variable.name .. " = " .. variable.value
        end
      end,
      virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",
      all_frames = false,
      virt_lines = false,
      virt_text_win_col = nil,
    })

    -- Automatically open/close DAP UI
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- DAP signs
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticHint", linehl = "DapStoppedLine", numhl = "" })

    -- Highlight for stopped line
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    -- Debug adapter configurations
    -- NOTE: Debug adapters must be installed independently
    -- Refer to: https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

    -- Python (debugpy)
    dap.adapters.python = {
      type = "executable",
      command = "python",
      args = { "-m", "debugpy.adapter" },
    }

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          -- Try to use virtual environment python if available
          local venv = os.getenv("VIRTUAL_ENV")
          if venv then
            return venv .. "/bin/python"
          end
          -- Fallback to system python
          return "python"
        end,
      },
      {
        type = "python",
        request = "launch",
        name = "Launch file with arguments",
        program = "${file}",
        args = function()
          local args_string = vim.fn.input("Arguments: ")
          return vim.split(args_string, " +")
        end,
        pythonPath = function()
          local venv = os.getenv("VIRTUAL_ENV")
          if venv then
            return venv .. "/bin/python"
          end
          return "python"
        end,
      },
      {
        type = "python",
        request = "launch",
        name = "Launch module",
        module = function()
          return vim.fn.input("Module name: ")
        end,
        pythonPath = function()
          local venv = os.getenv("VIRTUAL_ENV")
          if venv then
            return venv .. "/bin/python"
          end
          return "python"
        end,
      },
      {
        type = "python",
        request = "attach",
        name = "Attach remote",
        connect = function()
          local host = vim.fn.input("Host [127.0.0.1]: ")
          host = host ~= "" and host or "127.0.0.1"
          local port = tonumber(vim.fn.input("Port [5678]: ")) or 5678
          return { host = host, port = port }
        end,
      },
    }
  end,
}
