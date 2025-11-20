# Agent Guidelines for Neovim Config

## Testing

- Test config: `nvim --headless +checkhealth +qa`
- Test single plugin: `nvim -c "Lazy load <plugin-name>"`
- Verify syntax: `luac -p <file.lua>` or use lua-language-server

## Code Style

### Structure

- Place all Lua config in `lua/` directory, never in `init.lua` directly
- Plugin configs go in `lua/plugins/*.lua` as separate files
- Core settings in `lua/config/` (options.lua, keymaps.lua)
- Each plugin file returns a lazy.nvim spec table

### Formatting & Conventions

- 2 spaces for indentation (no tabs)
- Use double quotes for strings
- Add `---@diagnostic disable: undefined-global` at top of files to suppress
  vim global warnings
- Use descriptive variable names: `keymap` not `km`, `opts` not `o`
- Comment sections with `-- Section Name` format

### Plugin Patterns

- Always set `desc` for keymaps:
  `keymap.set("n", "<leader>ff", cmd, { desc = "Find files" })`
- Use `lazy = false` and `priority = 1000` for colorschemes
- Group related settings with blank lines between sections
- Load leader keys in `options.lua` BEFORE lazy.nvim setup

### Error Handling

- Don't suppress errors silently; let Neovim report them
- Use `pcall()` only when failure is expected and handled

## Package Management

- Never use Mason for package/tool installation
- All external tools (formatters, linters, LSP servers) must be installed independently
- Document required external dependencies in plugin config comments

## Commit Conventions

Follow conventional commit format: `<type>: <description>`

### Types

- `feat`: New feature or functionality
- `fix`: Bug fix
- `chore`: Routine tasks, maintenance (dependencies, configs)
- `refactor`: Code restructuring without behavior change
- `docs`: Documentation only changes
- `style`: Code style/formatting (whitespace, semicolons)
- `test`: Adding or updating tests
- `perf`: Performance improvements

### Examples

- `feat: add telescope fuzzy finder`
- `fix: resolve treesitter highlighting issue`
- `chore: update lazy-lock.json`
- `refactor: reorganize plugin configurations`
- `docs: update installation instructions`
