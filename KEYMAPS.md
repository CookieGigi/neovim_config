# Keymaps Reference

Complete reference for all keymaps organized by category.

## Legend

- `<leader>` = Space key
- `<localleader>` = Backslash (`\`)
- `n` = Normal mode
- `v` = Visual mode
- `i` = Insert mode
- `x` = Visual block mode

---

## Quick Reference Table

| Prefix | Category | Description |
|--------|----------|-------------|
| `<leader>b` | **Buffer** | Buffer management |
| `<leader>c` | **Code** | LSP code actions |
| `<leader>d` | **Debug** | DAP debugging |
| `<leader>f` | **Find/Files** | File finding |
| `<leader>g` | **Git** | Git operations |
| `<leader>l` | **LSP** | LSP symbols/workspace |
| `<leader>n` | **Notifications** | Notification management |
| `<leader>q` | **Quickfix** | Quickfix list |
| `<leader>s` | **Search** | Search operations |
| `<leader>t` | **Test** | Test running |
| `<leader>u` | **UI/Toggles** | UI toggles |
| `<leader>v` | **Scratch** | Scratch buffers |
| `<leader>w` | **Window** | Window management |
| `<leader>y` | **Yank** | Clipboard operations |

---

## Direct Mappings (No Leader)

### LSP Navigation

| Key | Mode | Description |
|-----|------|-------------|
| `gd` | n | Go to definition |
| `gD` | n | Go to declaration |
| `gr` | n | Show references |
| `gI` | n | Go to implementation |
| `gy` | n | Go to type definition |
| `K` | n | Show hover documentation |

### Navigation

| Key | Mode | Description |
|-----|------|-------------|
| `]d` | n | Next diagnostic |
| `[d` | n | Previous diagnostic |
| `]q` | n | Next quickfix item |
| `[q` | n | Previous quickfix item |
| `]Q` | n | Last quickfix item |
| `[Q` | n | First quickfix item |
| `]l` | n | Next location item |
| `[l` | n | Previous location item |
| `]t` | n | Next failed test |
| `[t` | n | Previous failed test |

### Window Navigation

| Key | Mode | Description |
|-----|------|-------------|
| `<C-h>` | n | Go to left split |
| `<C-j>` | n | Go to bottom split |
| `<C-k>` | n | Go to top split |
| `<C-l>` | n | Go to right split |

---

## Top-Level Shortcuts

| Key | Mode | Description |
|-----|------|-------------|
| `<leader><space>` | n | Smart find files |
| `<leader>,` | n | Buffers picker |
| `<leader>/` | n | Grep |
| `<leader>:` | n | Command history |
| `<C-s>` | n,i | Save file |
| `<C-q>` | n | Quit all |
| `<C-x>` | n | Save and quit |
| `<C-a>` | n | Select all |

---

## Buffer Management (`<leader>b*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>bd` | n | Delete buffer |
| `<leader>bn` | n | Next buffer |
| `<leader>bp` | n | Previous buffer |
| `<leader>bD` | n | Delete buffer (force) |

---

## Code Actions (`<leader>c*`) - LSP

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ca` | n,v | Code actions |
| `<leader>cr` | n | Rename symbol |
| `<leader>cf` | n,v | Format file or selection |

---

## Debug (`<leader>d*`) - DAP

### Session Control

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>dc` | n | Continue/Start |
| `<leader>dC` | n | Run to cursor |
| `<leader>dt` | n | Terminate |
| `<leader>dr` | n | Restart |
| `<leader>dp` | n | Pause |
| `<F5>` | n | Continue |

### Breakpoints

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>dbt` | n | Toggle breakpoint |
| `<leader>dbc` | n | Conditional breakpoint |
| `<leader>dbl` | n | Log point |
| `<leader>dbL` | n | List breakpoints |
| `<leader>dbx` | n | Clear all breakpoints |
| `<F9>` | n | Toggle breakpoint |

### Stepping

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>dso` | n | Step over |
| `<leader>dsi` | n | Step into |
| `<leader>dsu` | n | Step out |
| `<leader>dsb` | n | Step back |
| `<leader>dsr` | n | Restart frame |
| `<F10>` | n | Step over |
| `<F11>` | n | Step into |
| `<F12>` | n | Step out |

### UI

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>du` | n | Toggle UI |
| `<leader>dU` | n | Reset UI |

### Evaluation & REPL

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>de` | n | Toggle REPL |
| `<leader>dE` | n,v | Evaluate expression |
| `<leader>dh` | n | Hover variables |
| `<leader>dw` | n | Preview variables |

### Inspection

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>dis` | n | Inspect scopes |
| `<leader>dif` | n | Show frames |
| `<leader>dit` | n | Show threads |

---

## Diagnostics (`<leader>d*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>dd` | n | Show line diagnostics |
| `<leader>dl` | n | Show diagnostics in location list |
| `<leader>dq` | n | Show diagnostics in quickfix |

---

## File Explorer

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>e` | n | Open file explorer in new tab |
| `<leader>E` | n | Open file explorer in current window |

---

## Find/Files (`<leader>f*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>fb` | n | Buffers |
| `<leader>fc` | n | Find config file |
| `<leader>ff` | n | Find files |
| `<leader>fg` | n | Find git files |
| `<leader>fp` | n | Projects |
| `<leader>fr` | n | Recent files |

---

## Git (`<leader>g*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>gb` | n | Git branches |
| `<leader>gB` | n | Git blame line |
| `<leader>gg` | n | Lazygit |
| `<leader>gL` | n | Lazygit log |
| `<leader>gF` | n | Lazygit log file |
| `<leader>gc` | n | Git log (commits) |
| `<leader>gd` | n | Git diff (hunks) |
| `<leader>gf` | n | Git log file |
| `<leader>gl` | n | Git log line |
| `<leader>go` | n | Open in browser |
| `<leader>gs` | n | Git status |
| `<leader>gS` | n | Git stash |

### GitHub (`<leader>gh*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>ghi` | n | GitHub issues (open) |
| `<leader>ghI` | n | GitHub issues (all) |
| `<leader>ghp` | n | GitHub PRs (open) |
| `<leader>ghP` | n | GitHub PRs (all) |

---

## LSP (`<leader>l*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>lh` | n | Signature help |
| `<leader>ls` | n | Document symbols |
| `<leader>lS` | n | Workspace symbols |
| `<leader>li` | n | Incoming calls |
| `<leader>lo` | n | Outgoing calls |

### Workspace (`<leader>lw*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>lwa` | n | Add workspace folder |
| `<leader>lwr` | n | Remove workspace folder |
| `<leader>lwl` | n | List workspace folders |

### LSP Picker (`<leader>lp*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>lpd` | n | Picker: Definitions |
| `<leader>lpD` | n | Picker: Declarations |
| `<leader>lpr` | n | Picker: References |
| `<leader>lpi` | n | Picker: Implementations |
| `<leader>lpt` | n | Picker: Type Definitions |
| `<leader>lps` | n | Picker: Document Symbols |
| `<leader>lpS` | n | Picker: Workspace Symbols |

---

## Location List (`<leader>l*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>lo` | n | Open location list |
| `<leader>lc` | n | Close location list |
| `<leader>ln` | n | Next location item |
| `<leader>lp` | n | Previous location item |

---

## Notifications (`<leader>n*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>nd` | n | Dismiss all notifications |
| `<leader>nh` | n | Notification history |

---

## Quickfix (`<leader>q*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>qo` | n | Open quickfix list |
| `<leader>qc` | n | Close quickfix list |
| `<leader>qn` | n | Next quickfix item |
| `<leader>qp` | n | Previous quickfix item |
| `<leader>qf` | n | First quickfix item |
| `<leader>ql` | n | Last quickfix item |

---

## Search (`<leader>s*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>sb` | n | Buffer lines |
| `<leader>sB` | n | Grep open buffers |
| `<leader>sg` | n | Grep |
| `<leader>sw` | n,x | Visual selection or word |
| `<leader>sc` | n | Command history |
| `<leader>sC` | n | Commands |
| `<leader>sd` | n | Diagnostics |
| `<leader>sD` | n | Buffer diagnostics |
| `<leader>sh` | n | Help pages |
| `<leader>sH` | n | Highlights |
| `<leader>sk` | n | Keymaps |
| `<leader>sm` | n | Marks |
| `<leader>sM` | n | Man pages |
| `<leader>sq` | n | Quickfix list |
| `<leader>sR` | n | Resume |
| `<leader>su` | n | Undo history |

---

## Test (`<leader>t*`)

### Execution

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>tt` | n | Run nearest test |
| `<leader>tf` | n | Run current file |
| `<leader>ta` | n | Run all tests |
| `<leader>tl` | n | Run last test |
| `<leader>td` | n | Debug nearest test |

### Control

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>tcs` | n | Stop nearest test |
| `<leader>tca` | n | Attach to nearest test |

### Watch

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>twt` | n | Toggle watch nearest test |
| `<leader>twf` | n | Toggle watch file |

### Output

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>too` | n | Show test output |
| `<leader>top` | n | Toggle output panel |

### Summary

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>tS` | n | Toggle test summary |

---

## Scratch Buffers (`<leader>v*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>vt` | n | TODO scratch buffer |
| `<leader>vn` | n | Notes scratch buffer |
| `<leader>vs` | n | Snippets scratch buffer |
| `<leader>vq` | n | SQL scratch buffer |
| `<leader>vc` | n | Calculation scratch buffer |
| `<leader>vj` | n | Journal scratch buffer |
| `<leader>vr` | n | Regex tester scratch buffer |
| `<leader>vf` | n | JSON formatter scratch buffer |
| `<leader>v.` | n | Toggle scratch buffer |
| `<leader>vv` | n | Select scratch buffer |

---

## Window Management (`<leader>w*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>wv` | n | Split window vertically |
| `<leader>wh` | n | Split window horizontally |
| `<leader>we` | n | Make splits equal size |
| `<leader>wx` | n | Close current split |
| `<leader>wo` | n | Close other windows |
| `<leader>ww` | n | Switch windows |

### Window Resize

| Key | Mode | Description |
|-----|------|-------------|
| `<C-Up>` | n | Increase split height |
| `<C-Down>` | n | Decrease split height |
| `<C-Left>` | n | Decrease split width |
| `<C-Right>` | n | Increase split width |

---

## Clipboard/Yank (`<leader>y*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>y` | n,v | Copy to system clipboard |
| `<leader>Y` | n | Copy line to system clipboard |
| `<leader>p` | n,v | Paste from system clipboard |
| `<leader>P` | n,v | Paste before from system clipboard |

---

## Text Editing

| Key | Mode | Description |
|-----|------|-------------|
| `<` | v | Indent left (stay in visual) |
| `>` | v | Indent right (stay in visual) |
| `<A-j>` | n | Move line down |
| `<A-k>` | n | Move line up |
| `<A-j>` | v | Move selection down |
| `<A-k>` | v | Move selection up |

---

## Filetype-Specific

### Lua Files (`<localleader>*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<localleader>r` | n | Run Lua file |
| `<localleader>t` | n | Run Lua line |
| `<localleader>t` | v | Run Lua selection |

### Markdown Files (`<localleader>*`)

| Key | Mode | Description |
|-----|------|-------------|
| `<localleader>p` | n | Preview Markdown (glow) |
| `<localleader>P` | n | Preview Markdown (glow pager) |

### Help/Quickfix

| Key | Mode | Description |
|-----|------|-------------|
| `q` | n | Quit help/quickfix window |

---

## Tips

1. **Use which-key**: Press `<leader>` and wait to see available keymaps
2. **Consistent prefixes**: Remember the category prefixes (b=buffer, f=find, g=git, etc.)
3. **Direct LSP mappings**: `gd`, `gr`, `K` work without leader for quick navigation
4. **F-keys for debug**: Use F5-F12 for debugging like in traditional IDEs
