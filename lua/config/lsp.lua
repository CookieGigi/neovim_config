---@diagnostic disable: undefined-global

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})

-- Diagnostic signs
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- LSP keymaps are now managed by Snacks.keymap in lua/config/keymaps.lua
-- They automatically attach when LSP clients with required capabilities are present

-- LSP user commands
vim.api.nvim_create_user_command("LspRestart", function()
  vim.cmd("LspStop")
  vim.defer_fn(function()
    vim.cmd("LspStart")
  end, 100)
end, { desc = "Restart LSP servers" })

vim.api.nvim_create_user_command("LspInfo", function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    print("No LSP clients attached to current buffer")
    return
  end

  local lines = { "LSP clients attached to buffer " .. vim.api.nvim_get_current_buf() .. ":" }
  for _, client in ipairs(clients) do
    table.insert(lines, "")
    table.insert(lines, "Client: " .. client.name .. " (id: " .. client.id .. ")")
    table.insert(lines, "  Root dir: " .. (client.config.root_dir or "N/A"))
    table.insert(lines, "  Filetypes: " .. table.concat(client.config.filetypes or {}, ", "))
    table.insert(lines, "  Cmd: " .. vim.inspect(client.config.cmd))
  end

  vim.api.nvim_echo({ { table.concat(lines, "\n"), "Normal" } }, true, {})
end, { desc = "Show LSP client info" })

vim.api.nvim_create_user_command("LspDebug", function()
  local all_clients = vim.lsp.get_clients()
  local configs = vim.lsp.get_configs()

  print("=== All LSP Clients ===")
  for _, client in ipairs(all_clients) do
    print(string.format("ID: %d, Name: %s, Root: %s", client.id, client.name, client.config.root_dir or "N/A"))
  end

  print("\n=== LSP Configs ===")
  for name, config in pairs(configs) do
    print(string.format("Config name: %s", name))
  end
end, { desc = "Debug LSP configuration" })

-- Configure lua_ls using vim.lsp.config()
vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Enable lua_ls
vim.lsp.enable("lua_ls")

-- Configure rust-analyzer
vim.lsp.config("rust-analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", "rust-project.json" },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true,
        buildScripts = {
          enable = true,
        },
      },
      check = {
        command = "clippy",
        allFeatures = true,
      },
      procMacro = {
        enable = true,
      },
      diagnostics = {
        enable = true,
        experimental = {
          enable = true,
        },
      },
      inlayHints = {
        bindingModeHints = {
          enable = false,
        },
        chainingHints = {
          enable = true,
        },
        closingBraceHints = {
          enable = true,
          minLines = 25,
        },
        closureReturnTypeHints = {
          enable = "never",
        },
        lifetimeElisionHints = {
          enable = "never",
          useParameterNames = false,
        },
        maxLength = 25,
        parameterHints = {
          enable = true,
        },
        reborrowHints = {
          enable = "never",
        },
        renderColons = true,
        typeHints = {
          enable = true,
          hideClosureInitialization = false,
          hideNamedConstructor = false,
        },
      },
    },
  },
})

-- Enable rust-analyzer
vim.lsp.enable("rust-analyzer")
