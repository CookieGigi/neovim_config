---@diagnostic disable: undefined-global

-- Blink Completion Plugin
-- Performant, batteries-included completion plugin for Neovim
-- Docs: https://cmp.saghen.dev

return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",

  ---@module 'blink.cmp'
  opts = {
    -- Keymap configuration
    -- 'default' for C-y to accept, 'super-tab' for tab to accept, 'enter' for enter to accept
    -- All presets: C-space (menu/docs), C-n/C-p (navigate), C-e (hide), C-k (toggle signature)
    keymap = { preset = "default" },

    -- Appearance
    appearance = {
      nerd_font_variant = "mono",
    },

    -- Completion behavior
    completion = {
      -- Auto-brackets for functions/methods
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },

      -- Menu appearance with rounded borders
      menu = {
        border = "rounded",
        max_height = 15,
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
        },
      },

      -- Auto-show documentation with delay to prevent flicker
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = {
          border = "rounded",
          max_width = 80,
          max_height = 20,
        },
      },

      -- Ghost text for inline completion preview
      ghost_text = {
        enabled = true,
      },
    },

    -- Signature help window
    signature = {
      enabled = true,
      window = {
        border = "rounded",
      },
    },

    -- Source providers with enhanced configuration
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },

      providers = {
        lsp = {
          name = "LSP",
          module = "blink.cmp.sources.lsp",
          fallbacks = { "buffer" },
        },
        path = {
          name = "Path",
          module = "blink.cmp.sources.path",
          score_offset = 3,
          opts = {
            trailing_slash = true,
            label_trailing_slash = true,
            get_cwd = function(context)
              return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
            end,
            show_hidden_files_by_default = false,
          },
        },
        snippets = {
          name = "Snippets",
          module = "blink.cmp.sources.snippets",
          score_offset = -3,
        },
        buffer = {
          name = "Buffer",
          module = "blink.cmp.sources.buffer",
          score_offset = -3,
        },
      },
    },

    -- Fuzzy matching
    fuzzy = {
      use_proximity = true,
      frecency = {
        enabled = true,
      },
    },
  },
  opts_extend = { "sources.default" },
}
