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
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    print("No LSP clients to restart")
    return
  end

  for _, client in ipairs(clients) do
    local bufs = vim.lsp.get_buffers_by_client_id(client.id)
    vim.lsp.stop_client(client.id)

    vim.defer_fn(function()
      for _, buf in ipairs(bufs) do
        if vim.api.nvim_buf_is_valid(buf) then
          vim.api.nvim_exec_autocmds("FileType", { buffer = buf })
        end
      end
    end, 100)
  end

  print("LSP clients restarted")
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
  end

  vim.api.nvim_echo({ { table.concat(lines, "\n"), "Normal" } }, true, {})
end, { desc = "Show LSP client info" })

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

-- Configure basedpyright for Python
vim.lsp.config("basedpyright", {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json" },
    ".git",
  },
  settings = {
    basedpyright = {
      analysis = {
        -- Use workspace root for analysis
        autoSearchPaths = true,
        -- Use Python from virtual environment if available
        useLibraryCodeForTypes = true,
        -- Diagnostic mode: "openFilesOnly" or "workspace"
        diagnosticMode = "openFilesOnly",
        -- Type checking mode: "off", "basic", "standard", "strict"
        typeCheckingMode = "basic",
      },
    },
  },
})

-- Enable lua_ls
vim.lsp.enable("lua_ls")

-- Enable basedpyright
vim.lsp.enable("basedpyright")
