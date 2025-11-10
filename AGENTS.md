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
- Add `---@diagnostic disable: undefined-global` at top of files to suppress vim global warnings
- Use descriptive variable names: `keymap` not `km`, `opts` not `o`
- Comment sections with `-- Section Name` format

### Plugin Patterns
- Always set `desc` for keymaps: `keymap.set("n", "<leader>ff", cmd, { desc = "Find files" })`
- Use `lazy = false` and `priority = 1000` for colorschemes
- Group related settings with blank lines between sections
- Load leader keys in `options.lua` BEFORE lazy.nvim setup

### Error Handling
- Don't suppress errors silently; let Neovim report them
- Use `pcall()` only when failure is expected and handled
