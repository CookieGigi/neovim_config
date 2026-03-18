# Dependencies - Python Configuration

This document lists additional external tools required for the Python Neovim configuration.

**Note:** This configuration extends the base configuration. See [base/DEPENDENCIES.md](../base/DEPENDENCIES.md) for base requirements.

## Additional Required Tools

### LSP (Language Server Protocol)

| Tool | Purpose | Install Command |
|------|---------|-----------------|
| `basedpyright` | Python language server | `pip install basedpyright` |

### Formatters & Linters

| Tool | Purpose | Install Command |
|------|---------|-----------------|
| `ruff` | Python formatter and linter | `pip install ruff` |
| `mypy` | Python type checker | `pip install mypy` |

## Installation

### Using pip

```bash
pip install basedpyright ruff mypy
```

### Using pipx (recommended for tools)

```bash
pipx install basedpyright
pipx install ruff
pipx install mypy
```

### Using uv

```bash
uv tool install basedpyright
uv tool install ruff
uv tool install mypy
```

## Verification

Check that all tools are installed:

```bash
basedpyright-langserver --version
ruff --version
mypy --version
```

## Usage

Launch Neovim with Python configuration:

```bash
nvim-python .
# Or manually:
# NVIM_APPNAME=neovim/python nvim .
```
