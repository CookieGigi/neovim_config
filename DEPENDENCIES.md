# Dependencies - Rust Configuration

This document lists additional external tools required for the Rust Neovim configuration.

**Note:** This configuration extends the base configuration. See [base/DEPENDENCIES.md](../base/DEPENDENCIES.md) for base requirements.

## Additional Required Tools

### LSP (Language Server Protocol)

| Tool | Purpose | Install Command |
|------|---------|-----------------|
| `rust-analyzer` | Rust language server | `rustup component add rust-analyzer` |

### Formatters & Linters

| Tool | Purpose | Install Command |
|------|---------|-----------------|
| `rustfmt` | Rust formatter | `rustup component add rustfmt` |
| `clippy` | Rust linter | `rustup component add clippy` |

## Installation

All Rust tools are managed via rustup:

```bash
# Install rust-analyzer
rustup component add rust-analyzer

# Install rustfmt
rustup component add rustfmt

# Install clippy
rustup component add clippy
```

Or install all at once:

```bash
rustup component add rust-analyzer rustfmt clippy
```

## Verification

Check that all tools are installed:

```bash
rust-analyzer --version
rustfmt --version
clippy-driver --version
```

## Usage

Launch Neovim with Rust configuration:

```bash
nvim-rust .
# Or manually:
# NVIM_APPNAME=neovim/rust nvim .
```
