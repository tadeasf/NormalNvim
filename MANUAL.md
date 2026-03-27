# NormalNvim (tadeasf fork) - Keybinding Manual

**Leader key:** `Space`
**Local leader:** `,`

> Tip: Press `Space` and wait — which-key will show all available options.

---

## 1. General / Navigation

| Key | Mode | Action |
|-----|------|--------|
| `j` / `k` | Normal | Move cursor (respects wrapped lines) |
| `0` | Normal | Go to first non-blank character (aliased from `^`) |
| `gg` | Normal | Go to first line, first position |
| `G` | Normal | Go to last line, last position |
| `Ctrl+a` | Normal | Select all text |
| `Shift+Down/Up` | Normal | Fast move 7 lines down/up |
| `Shift+PageDown/Up` | Normal | Jump 20% of buffer |
| `Enter` / `Ctrl+m` | Normal | Hop to word (hop.nvim) |
| `gx` | Normal | Open file under cursor with system program |
| `ESC` | Normal | Clear search highlighting |
| `q` | Normal | Close help/quickfix/nofile windows |

---

## 2. File Operations

| Key | Mode | Action |
|-----|------|--------|
| `Space w` | Normal | Save file |
| `Space W` | Normal | Save as sudo (SudaWrite) |
| `Space n` | Normal | New file |
| `Space q` | Normal | Quit |
| `Ctrl+s` | Normal | Force write |

---

## 3. Clipboard

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+y` | Normal/Visual | Copy to system clipboard |
| `Ctrl+d` | Normal/Visual | Copy to clipboard and delete line |
| `Ctrl+p` | Normal | Paste from system clipboard |
| `c` / `C` | Normal/Visual | Change without yanking |
| `x` / `X` | Normal | Delete character without yanking (also deletes blank lines) |
| `p` | Visual | Paste without yanking replaced text |
| `P` | Visual | Yank then paste (original vim behavior) |

---

## 4. Buffers & Windows

### Buffer Management

| Key | Mode | Action |
|-----|------|--------|
| `Space c` | Normal | Wipe buffer (close buffer + window) |
| `Space C` | Normal | Close buffer (keep window) |
| `Space x` | Normal | Close buffer (keep window, alias) |
| `]b` / `[b` | Normal | Next / previous buffer |
| `Ctrl+k` / `Ctrl+j` | Normal | Next / previous buffer (quick switch) |
| `>b` / `<b` | Normal | Move buffer tab right / left |
| `Space bb` | Normal | Pick buffer from tabline |
| `Space bd` | Normal | Delete buffer from tabline (picker) |
| `Space bc` | Normal | Close all buffers except current |
| `Space bC` | Normal | Close all buffers |
| `Space ba` | Normal | Write all changed buffers |
| `Space bl` | Normal | Close buffers to the left |
| `Space br` | Normal | Close buffers to the right |
| `Space b\` | Normal | Open buffer in horizontal split (picker) |
| `Space b\|` | Normal | Open buffer in vertical split (picker) |

### Buffer Sort

| Key | Action |
|-----|--------|
| `Space bse` | Sort by extension |
| `Space bsr` | Sort by relative path |
| `Space bsp` | Sort by full path |
| `Space bsi` | Sort by indicator |
| `Space bsm` | Sort by modification time |

### Window / Split Management

| Key | Mode | Action |
|-----|------|--------|
| `\|` | Normal | Vertical split |
| `\` | Normal | Horizontal split |
| `Space bw` | Normal | Close window |
| `Ctrl+h/j/k/l` | Normal | Move between splits (smart-splits) |
| `Ctrl+Arrow` | Normal | Resize splits |

### Tabs

| Key | Action |
|-----|--------|
| `]t` | Next tab |
| `[t` | Previous tab |

---

## 5. Search (Telescope)

> All search commands start with `Space f`

### Text Search

| Key | Action |
|-----|--------|
| `Space ff` | **Grep project** (live grep, includes hidden files) |
| `Space fF` | **Grep open buffers only** |
| `Space fw` | Grep word under cursor |
| `Space f/` | Fuzzy find in current buffer |

### File Search

| Key | Action |
|-----|--------|
| `Space fs` | **Find files in workspace** (includes hidden) |
| `Space fa` | Find nvim config files |
| `Space fB` | Find open buffers |
| `Space fo` | Find recent files (oldfiles) |

### Other Search

| Key | Action |
|-----|--------|
| `Space f<CR>` | Resume previous search |
| `Space f'` | Find marks |
| `Space fC` | Find commands |
| `Space fh` | Find help tags |
| `Space fk` | Find keymaps |
| `Space fm` | Find man pages |
| `Space fn` | Find notifications |
| `Space fv` | Find vim registers |
| `Space ft` | Find themes/colorschemes |
| `Space fp` | Find projects |
| `Space fS` | Find snippets (LuaSnip) |
| `Space fy` | Find yank history |
| `Space fq` | Find macro history |
| `Space fu` | Find in undo tree |

### Search & Replace (Spectre)

| Key | Action |
|-----|--------|
| `Space fr` | Find and replace in project |
| `Space fb` | Find and replace in buffer |

---

## 6. LSP (Language Server)

> Available when an LSP server is attached. All LSP commands under `Space l`.

### Navigation

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gI` | Go to implementation |
| `gT` | Go to type definition |
| `gr` | Find references |
| `gh` | Hover help (documentation) |
| `gH` | Signature help |
| `gm` | Hover man page |
| `gj` | Incoming call tree |
| `gJ` | Outgoing call tree |
| `gS` | Search workspace symbol |
| `gs` | Search buffer symbol (aerial) |

### Actions

| Key | Action |
|-----|--------|
| `Space la` | Code action |
| `Space lf` | Format buffer |
| `Space lr` | Rename symbol |
| `Space ll` | Run CodeLens |
| `Space lL` | Restart LSP |
| `Space lR` | Find references |
| `Space lS` | Search workspace symbol |
| `Space ls` | Search buffer symbol |
| `Space li` | LSP info |
| `Space lI` | Null-ls info |
| `Space ld` | Hover diagnostics |
| `Space lD` | All diagnostics (telescope) |
| `Space lh` | Hover help |
| `Space lH` | Signature help |
| `Space lm` | Hover man |

### Diagnostics

| Key | Action |
|-----|--------|
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `gl` | Hover diagnostics |

---

## 7. Completion (nvim-cmp)

| Key | Mode | Action |
|-----|------|--------|
| `Tab` | Insert | **Accept Copilot suggestion** (if visible) / Next cmp item / Expand snippet |
| `Shift+Tab` | Insert | Previous cmp item / Previous snippet jump |
| `Ctrl+j` / `Ctrl+k` | Insert | Next / previous completion item |
| `Ctrl+Space` | Insert | Trigger completion menu |
| `Ctrl+e` | Insert | Abort completion |
| `Enter` | Insert | Confirm selected completion |
| `Ctrl+u` / `Ctrl+d` | Insert | Scroll docs up / down |
| `PageUp/Down` | Insert | Jump 8 items in completion |
| `Up/Down` | Insert | Navigate completion items |

---

## 8. Copilot (GitHub)

Copilot shows **ghost text** (gray inline suggestions) as you type.

| Key | Mode | Action |
|-----|------|--------|
| `Tab` | Insert | **Accept** copilot suggestion (priority over cmp) |
| `Alt+]` | Insert | Next suggestion |
| `Alt+[` | Insert | Previous suggestion |
| `Ctrl+x` | Insert | Dismiss suggestion |
| `Ctrl+\` | Insert | Manually trigger suggestion |

> Copilot auto-triggers after 75ms. Run `:Copilot auth` to authenticate.

---

## 9. Git

> All git commands under `Space g`. Requires gitsigns.nvim.

| Key | Action |
|-----|--------|
| `Space gg` | Open lazygit / gitui (TUI client) |
| `Space gl` | View git blame (current line) |
| `Space gL` | View full git blame |
| `Space gp` | Preview git hunk |
| `Space gh` | Reset git hunk |
| `Space gr` | Reset git buffer |
| `Space gs` | Stage git hunk |
| `Space gS` | Stage git buffer |
| `Space gu` | Unstage git hunk |
| `Space gd` | View git diff |
| `Space gP` | Open in GitHub (fugitive) |
| `]g` / `[g` | Next / previous git hunk |

### Git Search (Telescope)

| Key | Action |
|-----|--------|
| `Space gb` | Git branches |
| `Space gc` | Git commits (repo) |
| `Space gC` | Git commits (current file) |
| `Space gt` | Git status |

---

## 10. Terminal (ToggleTerm)

| Key | Mode | Action |
|-----|------|--------|
| `Space tt` | Normal | Float terminal |
| `Space th` | Normal | Horizontal split terminal |
| `Space tv` | Normal | Vertical split terminal |
| `F7` | Normal/Terminal | Toggle terminal |
| `Ctrl+'` | Normal/Terminal | Toggle terminal |
| `Ctrl+h/j/k/l` | Terminal | Navigate between splits |

---

## 11. Sessions

> All session commands under `Space S`.

| Key | Action |
|-----|--------|
| `Space Sl` | Load last session |
| `Space Ss` | Save current session |
| `Space Sd` | Delete session |
| `Space Sf` | Search sessions |
| `Space S.` | Load current directory session |

---

## 12. Debugging (DAP)

> All debugger commands under `Space d`. Also available via F-keys.

### F-Key Shortcuts

| Key | Action |
|-----|--------|
| `F5` | Start / Continue |
| `Shift+F5` | Stop / Terminate |
| `Ctrl+F5` | Restart |
| `F9` | Toggle breakpoint |
| `Shift+F9` | Conditional breakpoint |
| `F10` | Step over |
| `Shift+F10` | Step back |
| `F11` | Step into |
| `Shift+F11` | Step out |

### Space+d Shortcuts

| Key | Action |
|-----|--------|
| `Space dc` | Start / Continue |
| `Space dq` | Close session |
| `Space dQ` | Terminate session |
| `Space db` | Step into |
| `Space dB` | Clear all breakpoints |
| `Space dC` | Conditional breakpoint |
| `Space do` | Step back |
| `Space dO` | Step out |
| `Space dp` | Pause |
| `Space dr` | Restart |
| `Space dR` | Toggle REPL |
| `Space ds` | Run to cursor |
| `Space du` | Toggle debugger UI |
| `Space dh` | Debugger hover |
| `Space dE` | Evaluate expression |

---

## 13. Testing (Neotest)

> All test commands under `Space T`.

| Key | Action |
|-----|--------|
| `Space Tu` | Run unit test (nearest) |
| `Space Ts` | Stop test |
| `Space Tf` | Run all tests in file |
| `Space Td` | Run test in debugger |
| `Space Tt` | Toggle test summary |
| `Space TT` | Toggle output panel |
| `Space Tc` | Show coverage summary |
| `Space TC` | Toggle coverage signs |
| `Space Ta` | Run all Node.js tests |
| `Space Te` | Run Node.js E2E tests |

---

## 14. UI Toggles

> All under `Space u`.

| Key | Action |
|-----|--------|
| `Space ua` | Toggle autopairs |
| `Space ub` | Toggle background (light/dark) |
| `Space uc` | Toggle autocompletion |
| `Space uC` | Toggle color highlight |
| `Space ud` | Toggle diagnostics |
| `Space uD` | Change indent setting |
| `Space uf` | Toggle buffer autoformat |
| `Space uF` | Toggle global autoformat |
| `Space ug` | Toggle signcolumn |
| `Space uh` | Toggle foldcolumn |
| `Space uH` | Toggle LSP inlay hints (buffer) |
| `Space ul` | Toggle statusline |
| `Space uL` | Toggle CodeLens |
| `Space un` | Change line numbering |
| `Space uN` | Toggle notifications |
| `Space up` | Toggle LSP signature |
| `Space uP` | Toggle paste mode |
| `Space us` | Toggle spellcheck |
| `Space uS` | Toggle conceal |
| `Space ut` | Toggle tabline |
| `Space uu` | Toggle URL highlight |
| `Space uw` | Toggle line wrap |
| `Space uy` | Toggle syntax highlight (buffer) |
| `Space uY` | Toggle semantic tokens (buffer) |
| `Space uz` | Toggle zen mode |
| `Space uA` | Toggle animations |

---

## 15. File Browsers

| Key | Action |
|-----|--------|
| `Space e` | Toggle Neo-tree (sidebar file tree) |
| `Space r` | Open Yazi (terminal file manager) |

---

## 16. Compiler / Build

> Requires compiler.nvim + overseer.nvim. Under `Space m`.

| Key | Action |
|-----|--------|
| `Space mm` / `F6` | Open compiler |
| `Space mr` / `Shift+F6` | Compiler redo |
| `Space mt` / `Shift+F7` | Toggle compiler results |

---

## 17. Code Folding (nvim-ufo)

| Key | Action |
|-----|--------|
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zr` | Fold less |
| `zm` | Fold more |
| `zp` | Peek folded lines |
| `zn` | Fold comments only |
| `zN` | Fold regions only |

---

## 18. Documentation

> Under `Space D`.

| Key | Action |
|-----|--------|
| `Space Dp` | Markdown preview (browser) |
| `Space Dm` | Markmap (mindmap visualization) |
| `Space Dd` | Generate documentation (Dooku) |

---

## 19. Other Features

### Code Navigation

| Key | Action |
|-----|--------|
| `Space i` | Toggle Aerial (symbol outline sidebar) |
| `gj` | Incoming call tree |
| `gJ` | Outgoing call tree |

### Comments

| Key | Mode | Action |
|-----|------|--------|
| `Space /` | Normal | Toggle comment line |
| `Space /` | Visual | Toggle comment selection |

### Indentation (Visual Mode)

| Key | Action |
|-----|--------|
| `Tab` | Indent selection |
| `Shift+Tab` | Unindent selection |
| `>` / `<` | Indent / unindent (keeps selection) |

### Packages

| Key | Action |
|-----|--------|
| `Space pu` | Open Lazy (plugin manager) |
| `Space pU` | Update plugins (Lazy) |
| `Space pm` | Open Mason (LSP/tool installer) |
| `Space pM` | Update all Mason packages |
| `Space pt` | Treesitter info |
| `Space pT` | Treesitter update |
| `Space pD` | Distro update |
| `Space pv` | Distro version |
| `Space pc` | Distro changelog |

### Dashboard

| Key | Action |
|-----|--------|
| `Space h` | Home screen (alpha-nvim) |

### AI / Claude Code (claudecode.nvim)

| Key | Mode | Action |
|-----|------|--------|
| `Space ac` | Normal | Toggle Claude Code terminal |
| `Space af` | Normal | Focus/toggle Claude terminal |
| `Space ar` | Normal | Resume previous Claude conversation |
| `Space aC` | Normal | Continue last Claude conversation |
| `Space ab` | Normal | Add current buffer to Claude context |
| `Space as` | Visual | Send selection to Claude |
| `Space as` | Normal (file tree) | Add file from tree to Claude context |

---

## 20. Telescope Navigation (Inside Picker)

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+j` | Insert | Next item |
| `Ctrl+k` | Insert | Previous item |
| `ESC` | Insert | Close picker |
| `q` | Normal | Close picker |

---

## Quick Reference Card

```
MOST USED:
  Space w     Save          Space ff    Grep project
  Space x     Close buffer  Space fs    Find files
  Space e     File tree     Space fF    Grep open buffers
  Space /     Comment       Space f/    Search in buffer

  gd          Go to def     Space la    Code action
  gh          Hover docs    Space lf    Format
  gr          References    Space lr    Rename

  Tab         Accept copilot / next completion
  Alt+]/[     Next/prev copilot suggestion

  Space gg    Lazygit       Space tt    Terminal
  F5          Debug start   F9          Breakpoint
```
