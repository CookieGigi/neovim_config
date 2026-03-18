# Dependencies - Base Configuration

This document lists all external tools required for the base Neovim configuration.

## Required Tools

### LSP (Language Server Protocol)

| Tool | Purpose | Install Command |
|------|---------|-----------------|
| `lua-language-server` | Lua language server | System package manager (see below) |

### Formatters

| Tool | Purpose | Install Command |
|------|---------|-----------------|
| `stylua` | Lua formatter | `cargo install stylua` |

### Linters & Additional Tools

| Tool | Purpose | Install Command |
|------|---------|-----------------|
| `@biomejs/biome` | JSON formatter/linter | `npm install -g @biomejs/biome` |
| `prettier` | Markdown formatter | `npm install -g prettier` |
| `markdownlint-cli` | Markdown linter | `npm install -g markdownlint-cli` |

## Installation by Platform

### Ubuntu/Debian

```bash
# Lua LSP
sudo apt install lua-language-server

# Rust tools (for stylua)
cargo install stylua

# Node.js tools
npm install -g @biomejs/biome prettier markdownlint-cli
```

### Arch Linux

```bash
# Lua LSP
sudo pacman -S lua-language-server

# Rust tools (for stylua)
cargo install stylua

# Node.js tools
npm install -g @biomejs/biome prettier markdownlint-cli
```

### macOS

```bash
# Lua LSP
brew install lua-language-server

# Rust tools (for stylua)
brew install stylua
# OR: cargo install stylua

# Node.js tools
npm install -g @biomejs/biome prettier markdownlint-cli
```

## Verification

Check that all tools are installed:

```bash
lua-language-server --version
stylua --version
biome --version
prettier --version
markdownlint --version
```

## Language-Specific Configurations

For additional dependencies needed by other worktrees:

- [python/DEPENDENCIES.md](../python/DEPENDENCIES.md) - Python development
- [rust/DEPENDENCIES.md](../rust/DEPENDENCIES.md) - Rust development
- [node/DEPENDENCIES.md](../node/DEPENDENCIES.md) - TypeScript/Node.js development
