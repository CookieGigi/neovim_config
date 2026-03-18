# Neovim Config Base

A minimal Neovim configuration with lazy.nvim plugin manager.

## Structure

```text
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

### Quick Setup (Recommended)

Use the provided setup script to automatically create symlinks and aliases:

```bash
cd ~/Project/neovim/base
./setup.sh
```

This will:
- Create symlinks in `~/.config/neovim/` pointing to each worktree
- Add aliases to your shell config (`nvim-base`, `nvim-python`, etc.)

### Manual Setup

1. **Install required external tools**:

   See [DEPENDENCIES.md](./DEPENDENCIES.md) for the full list.

   ```bash
    # Stylua (Lua formatter)
    cargo install stylua
    # OR use your system package manager

    # Node.js tools (biome, prettier, markdownlint)
    npm install -g @biomejs/biome prettier markdownlint-cli

    # Lua LSP (via your package manager)
    # Ubuntu/Debian: sudo apt install lua-language-server
    # Arch: sudo pacman -S lua-language-server

    # Ansible Language Server (for YAML/Ansible support)
    npm install -g @ansible/ansible-language-server

    # Optional: ansible-lint (for enhanced validation)
    pip install ansible-lint
   ```

2. **Backup your existing config** (if you have one):

   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

3. **Symlink or copy this config**:

   ```bash
   # For single config usage:
   ln -s ~/Project/neovim/base ~/.config/nvim

   # For multiple configs with NVIM_APPNAME:
   mkdir -p ~/.config/neovim
   ln -s ~/Project/neovim/base ~/.config/neovim/base
   ln -s ~/Project/neovim/python ~/.config/neovim/python
   ln -s ~/Project/neovim/rust ~/.config/neovim/rust
   ln -s ~/Project/neovim/node ~/.config/neovim/node
   ```

4. **Add aliases to your shell** (`.bashrc` or `.zshrc`):

   ```bash
   # Base config
   alias nvim-base='NVIM_APPNAME=neovim/base nvim'

   # Language-specific configs
   alias nvim-python='NVIM_APPNAME=neovim/python nvim'
   alias nvim-rust='NVIM_APPNAME=neovim/rust nvim'
   alias nvim-node='NVIM_APPNAME=neovim/node nvim'
   ```

5. **Launch Neovim**:

   ```bash
   # Using default config
   nvim

   # Using specific config with NVIM_APPNAME
   NVIM_APPNAME=neovim/base nvim

   # Or using aliases
   nvim-base
   nvim-python .
   nvim-rust src/
   ```

   On first launch, lazy.nvim will automatically install itself and plugins.

## Multiple Configurations

This repository uses **git worktrees** to manage multiple Neovim configurations:

| Worktree | Branch | Purpose |
|----------|--------|---------|
| `base/` | main | Base configuration (Lua, JSON, Markdown) |
| `python/` | python | Python development (includes base + Python LSP) |
| `rust/` | rust | Rust development (includes base + Rust LSP) |
| `node/` | node | TypeScript/Node.js (includes base + TS LSP) |

### How NVIM_APPNAME Works

`NVIM_APPNAME` tells Neovim which configuration directory to use (relative to `~/.config/`):

```bash
# Uses ~/.config/neovim/base
NVIM_APPNAME=neovim/base nvim

# Uses ~/.config/neovim/python
NVIM_APPNAME=neovim/python nvim
```

### Project-Based Usage

Switch configs based on project type:

```bash
# Python project
cd ~/projects/my-python-app
nvim-python .

# Rust project
cd ~/projects/my-rust-app
nvim-rust .

# TypeScript/React project
cd ~/projects/my-react-app
nvim-node .
```

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

To add plugins, create files in `lua/plugins/` directory. Each file should
return a table with plugin specifications.

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

Check [awesome-neovim](https://github.com/rockerBOO/awesome-neovim) for more
plugins!
