# Dependencies - Node/TypeScript Configuration

This document lists additional external tools required for the Node.js/TypeScript Neovim configuration.

**Note:** This configuration extends the base configuration. See [base/DEPENDENCIES.md](../base/DEPENDENCIES.md) for base requirements.

## Additional Required Tools

### LSP (Language Server Protocol)

| Tool | Purpose | Install Command |
|------|---------|-----------------|
| `typescript-language-server` | TypeScript/JavaScript language server | `npm install -g typescript-language-server` |

### Linters

| Tool | Purpose | Install Command |
|------|---------|-----------------|
| `eslint` | JavaScript/TypeScript linter | `npm install -g eslint` |

## Installation

### Using npm

```bash
npm install -g typescript-language-server eslint
```

### Using pnpm

```bash
pnpm add -g typescript-language-server eslint
```

### Using yarn

```bash
yarn global add typescript-language-server eslint
```

## Project-specific ESLint

For project-specific ESLint configurations, install eslint locally in your project:

```bash
npm install -D eslint
# or
pnpm add -D eslint
```

## Verification

Check that all tools are installed:

```bash
typescript-language-server --version
eslint --version
```

## Usage

Launch Neovim with Node/TypeScript configuration:

```bash
nvim-node .
# Or manually:
# NVIM_APPNAME=neovim/node nvim .
```

## Language-Specific Configurations

For additional dependencies needed by other worktrees:

- [python/DEPENDENCIES.md](../python/DEPENDENCIES.md) - Python development
- [rust/DEPENDENCIES.md](../rust/DEPENDENCIES.md) - Rust development
- [node/DEPENDENCIES.md](../node/DEPENDENCIES.md) - TypeScript/Node.js development
