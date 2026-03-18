#!/bin/bash
#
# setup.sh - Setup Neovim configuration worktrees
#
# This script creates symlinks from ~/.config/neovim/ to ~/Project/neovim/
# and adds shell aliases for easy switching between configurations.
#

set -e

# Configuration
NVIM_DIR="${HOME}/Project/neovim"
CONFIG_DIR="${HOME}/.config/neovim"

# Worktrees to set up
WORKTREES=("base" "python" "rust" "node")

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print functions
print_info() {
  echo -e "${BLUE}ℹ${NC} $1"
}

print_success() {
  echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
  echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
  echo -e "${RED}✗${NC} $1"
}

# Detect shell
get_shell_rc() {
  local shell_name="${SHELL##*/}"
  case "$shell_name" in
    bash)
      echo "${HOME}/.bashrc"
      ;;
    zsh)
      echo "${HOME}/.zshrc"
      ;;
    *)
      echo ""
      ;;
  esac
}

# Check if Neovim directory exists
check_nvim_dir() {
  if [ ! -d "$NVIM_DIR" ]; then
    print_error "Neovim directory not found: $NVIM_DIR"
    echo "Please clone your neovim config repository first."
    exit 1
  fi
}

# Create config directory
create_config_dir() {
  if [ ! -d "$CONFIG_DIR" ]; then
    print_info "Creating config directory: $CONFIG_DIR"
    mkdir -p "$CONFIG_DIR"
  fi
}

# Create symlinks
create_symlinks() {
  print_info "Creating symlinks..."

  for worktree in "${WORKTREES[@]}"; do
    local source_dir="${NVIM_DIR}/${worktree}"
    local link_path="${CONFIG_DIR}/${worktree}"

    # Check if source directory exists
    if [ ! -d "$source_dir" ]; then
      print_warning "Skipping $worktree - directory not found: $source_dir"
      continue
    fi

    # Check if symlink already exists
    if [ -L "$link_path" ]; then
      # Check if it points to the right place
      if [ "$(readlink "$link_path")" = "$source_dir" ]; then
        print_success "Symlink already exists for $worktree"
        continue
      else
        print_warning "Updating existing symlink for $worktree"
        rm "$link_path"
      fi
    elif [ -e "$link_path" ]; then
      print_warning "Backing up existing directory: $link_path"
      mv "$link_path" "${link_path}.backup.$(date +%Y%m%d_%H%M%S)"
    fi

    # Create symlink
    ln -s "$source_dir" "$link_path"
    print_success "Created symlink: $link_path → $source_dir"
  done
}

# Add aliases to shell config
add_aliases() {
  local shell_rc="$(get_shell_rc)"

  if [ -z "$shell_rc" ]; then
    print_warning "Could not detect shell configuration file."
    echo "Please add these aliases manually to your shell config:"
    for worktree in "${WORKTREES[@]}"; do
      echo "  alias nvim-${worktree}='NVIM_APPNAME=neovim/${worktree} nvim'"
    done
    return
  fi

  print_info "Adding aliases to $shell_rc..."

  # Create backup
  cp "$shell_rc" "${shell_rc}.backup.$(date +%Y%m%d_%H%M%S)"

  # Add aliases
  local aliases_added=0
  for worktree in "${WORKTREES[@]}"; do
    local alias_name="nvim-${worktree}"
    local alias_cmd="NVIM_APPNAME=neovim/${worktree} nvim"

    # Check if alias already exists
    if grep -qE "^alias ${alias_name}[[:space:]]*=" "$shell_rc" 2>/dev/null; then
      print_success "Alias already exists: $alias_name"
      continue
    fi

    # Add alias
    echo "" >> "$shell_rc"
    echo "# Neovim ${worktree} configuration" >> "$shell_rc"
    echo "alias ${alias_name}='${alias_cmd}'" >> "$shell_rc"
    print_success "Added alias: $alias_name"
    ((aliases_added++))
  done

  if [ $aliases_added -gt 0 ]; then
    echo ""
    print_info "Aliases added to $shell_rc"
    print_info "Run 'source $shell_rc' to apply changes"
  fi
}

# Print usage
print_usage() {
  cat << EOF
Usage: $(basename "$0") [OPTIONS] [WORKTREE]

Setup Neovim configuration worktrees by creating symlinks and shell aliases.

OPTIONS:
  -h, --help      Show this help message
  -s, --symlinks  Create symlinks only (skip aliases)
  -a, --aliases   Add aliases only (skip symlinks)

WORKTREE:
  Specific worktree to setup (base, python, rust, node)
  If not specified, all worktrees will be setup

EXAMPLES:
  ./setup.sh              # Setup all worktrees
  ./setup.sh base         # Setup only base config
  ./setup.sh -s           # Create symlinks only
  ./setup.sh -a python    # Add aliases for python config only

EOF
}

# Main function
main() {
  local do_symlinks=true
  local do_aliases=true
  local specific_worktree=""

  # Parse arguments
  while [[ $# -gt 0 ]]; do
    case $1 in
      -h|--help)
        print_usage
        exit 0
        ;;
      -s|--symlinks)
        do_aliases=false
        shift
        ;;
      -a|--aliases)
        do_symlinks=false
        shift
        ;;
      -*)
        print_error "Unknown option: $1"
        print_usage
        exit 1
        ;;
      *)
        specific_worktree=$1
        shift
        ;;
    esac
  done

  # Set specific worktree if provided
  if [ -n "$specific_worktree" ]; then
    local found=false
    for wt in "${WORKTREES[@]}"; do
      if [ "$wt" = "$specific_worktree" ]; then
        found=true
        break
      fi
    done
    if [ "$found" = false ]; then
      print_error "Unknown worktree: $specific_worktree"
      echo "Valid worktrees: ${WORKTREES[*]}"
      exit 1
    fi
    WORKTREES=("$specific_worktree")
  fi

  echo "========================================"
  echo "  Neovim Configuration Setup"
  echo "========================================"
  echo ""

  # Check prerequisites
  check_nvim_dir

  # Create symlinks
  if [ "$do_symlinks" = true ]; then
    create_config_dir
    create_symlinks
    echo ""
  fi

  # Add aliases
  if [ "$do_aliases" = true ]; then
    add_aliases
    echo ""
  fi

  echo "========================================"
  print_success "Setup complete!"
  echo "========================================"
  echo ""
  echo "Usage:"
  for worktree in "${WORKTREES[@]}"; do
    echo "  nvim-${worktree} .     # Launch with ${worktree} config"
  done
  echo ""
  echo "Or manually:"
  for worktree in "${WORKTREES[@]}"; do
    echo "  NVIM_APPNAME=neovim/${worktree} nvim ."
  done
}

# Run main function
main "$@"
