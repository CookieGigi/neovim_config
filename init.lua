-- Load config (options must be loaded first to set leader keys)
require("config.options")

-- lazyvim (load plugins before keymaps)
require("config.lazy")

-- Keymaps (load after lazy so Snacks.keymap is available)
require("config.keymaps")

-- Diagnostic
require("config.diagnostic")

-- LSP
require("config.lsp")

-- DAP Adapters are now loaded in lua/plugins/dap.lua config function
