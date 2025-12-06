-- Debug Adapter Protocol (DAP) adapter configurations
-- Language-specific debug adapters for nvim-dap

local dap = require("dap")

-- ============================================================================
-- Rust / C / C++ - CodeLLDB Adapter
-- ============================================================================
-- CodeLLDB is a modern LLDB-based debugger for Rust, C, and C++
-- Installation: Should already be installed on system (via VSCode extension, cargo, or package manager)

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    -- Full path to codelldb (shell aliases don't work in nvim-dap)
    command = vim.fn.expand("~/.nix-profile/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb"),
    args = { "--port", "${port}" },
  },
}

-- ============================================================================
-- Rust Debug Configurations
-- ============================================================================

dap.configurations.rust = {
  -- Launch configuration: Run a Rust binary
  {
    name = "Launch Rust Binary",
    type = "codelldb",
    request = "launch",
    program = function()
      -- Prompt for the executable path, defaulting to target/debug/
      return vim.fn.input({
        prompt = "Path to executable: ",
        default = vim.fn.getcwd() .. "/target/debug/",
        completion = "file",
      })
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },

  -- Launch with arguments
  {
    name = "Launch Rust Binary (with args)",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input({
        prompt = "Path to executable: ",
        default = vim.fn.getcwd() .. "/target/debug/",
        completion = "file",
      })
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = function()
      local args_str = vim.fn.input("Arguments: ")
      return vim.split(args_str, " ")
    end,
    runInTerminal = false,
  },

  -- Debug tests
  {
    name = "Debug Rust Tests",
    type = "codelldb",
    request = "launch",
    program = function()
      -- Run cargo test --no-run to build tests, then extract the binary path
      vim.fn.system("cargo test --no-run 2>&1 | tee /tmp/cargo-test-build.log")

      -- Prompt user to select test binary (for workspaces with multiple test binaries)
      return vim.fn.input({
        prompt = "Path to test executable: ",
        default = vim.fn.getcwd() .. "/target/debug/deps/",
        completion = "file",
      })
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}
