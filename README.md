# Neovim Config Base

A minimal Neovim configuration with lazy.nvim plugin manager.

## Structure

```
base/
├── init.lua                    # Entry point + lazy.nvim bootstrap
├── lua/
│   ├── config/
│   │   ├── options.lua        # Vim options (line numbers, tabs, search, etc.)
│   │   └── keymaps.lua        # Key mappings
│   └── plugins/               # Empty - add your plugins here!
└── README.md
```

## Installation

1. **Install required external tools**:
   ```bash
   # Stylua (Lua formatter)
   cargo install stylua
   # OR use your system package manager
   ```

2. **Backup your existing config** (if you have one):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

3. **Symlink or copy this config**:
   ```bash
   ln -s ~/Project/neovim/base ~/.config/nvim
   # OR
   cp -r ~/Project/neovim/base ~/.config/nvim
   ```

4. **Launch Neovim**:
   ```bash
   nvim
   ```
   
   On first launch, lazy.nvim will automatically install itself and plugins.

## Key Mappings

Leader key is `<Space>`.

### General
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>x` - Save and quit
- `<leader>nh` - Clear search highlights

### Window Management
- `<leader>sv` - Split window vertically
- `<leader>sh` - Split window horizontally
- `<leader>se` - Make splits equal size
- `<leader>sx` - Close current split
- `<C-h/j/k/l>` - Navigate between splits
- `<C-Up/Down/Left/Right>` - Resize splits

### Buffer Navigation
- `<Tab>` - Next buffer
- `<Shift-Tab>` - Previous buffer
- `<leader>bd` - Delete buffer

### Editing
- `<` / `>` in visual mode - Indent left/right (keeps selection)
- `<Alt-j/k>` - Move line/selection up/down

### Formatting
- `<leader>fm` - Format file or selection (requires stylua installed)

## Adding Plugins

To add plugins, create files in `lua/plugins/` directory. Each file should return a table with plugin specifications.

### Example: Adding a colorscheme

Create `lua/plugins/colorscheme.lua`:

```lua
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme tokyonight]])
  end,
}
```

### Example: Adding Telescope (fuzzy finder)

Create `lua/plugins/telescope.lua`:

```lua
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
  },
}
```

Then restart Neovim and lazy.nvim will install the plugins automatically!

## Useful Commands

- `:Lazy` - Open lazy.nvim UI to manage plugins
- `:Lazy install` - Install missing plugins
- `:Lazy update` - Update plugins
- `:Lazy clean` - Remove unused plugins
- `:checkhealth` - Check Neovim health

## Configuration Files

### `init.lua`
Entry point that:
- Bootstraps lazy.nvim (auto-installs it)
- Loads options and keymaps
- Sets up plugin loading

### `lua/config/options.lua`
Basic Vim options:
- Line numbers (relative + absolute)
- 2-space tabs with auto-indent
- Smart case-insensitive search
- System clipboard integration
- No swap files, persistent undo
- Proper split behavior

### `lua/config/keymaps.lua`
Essential keybindings for:
- File operations
- Window/split management
- Buffer navigation
- Visual mode editing

### `.stylua.toml`
Stylua configuration ensuring code is formatted with:
- 2 spaces indentation
- Double quotes preferred
- 120 character line width
- Consistent Lua formatting

## Next Steps

This is a bare-minimum config. Here are some popular plugins to consider:

- **Colorscheme**: tokyonight.nvim, catppuccin, gruvbox
- **File Explorer**: neo-tree.nvim, nvim-tree
- **Fuzzy Finder**: telescope.nvim
- **LSP**: nvim-lspconfig + mason.nvim
- **Autocompletion**: nvim-cmp
- **Syntax**: nvim-treesitter
- **Git**: gitsigns.nvim, fugitive
- **Status Line**: lualine.nvim

Check [awesome-neovim](https://github.com/rockerBOO/awesome-neovim) for more plugins!