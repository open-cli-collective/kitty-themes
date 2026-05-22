# kitty-tools

Scripts for converting color schemes and generating preview images.

## Generating preview images

Each theme in `themes/` should have a matching `previews/<ThemeName>/preview.png`. The pipeline below regenerates them — used when adding new themes, or to refresh the whole set.

### Prerequisites

**Tools:**
```bash
brew install figlet expect imagemagick
```
- `figlet` — renders the theme name as the ASCII banner
- `expect` — provides `unbuffer`, used so `color_table.sh` keeps ANSI escapes when piped
- `imagemagick` — provides `mogrify`, used to resize captures to ≤1024px wide

**Figlet font:** the `digital` font is required (`figlet -f digital test` should render block/segmented digit characters, not the default ASCII art). Homebrew's `figlet` formula ships it under `/opt/homebrew/share/figlet/fonts/digital.flf`.

**Kitty config — temporary additions to `~/.config/kitty/kitty.conf`:**
```
allow_remote_control yes
listen_on unix:/tmp/kitty
hide_window_decorations yes
```
- `allow_remote_control` + `listen_on` — required for the script to drive a kitty window via `kitty @ ...`
- `hide_window_decorations` — strips the titlebar so screenshots are clean

**Fully quit and relaunch kitty after editing kitty.conf** (Cmd+Q on macOS, not just closing the window — the config only re-reads on a fresh launch).

**macOS Screen Recording permission:**
1. Open System Settings → Privacy & Security → Screen Recording
2. Click `+` and add `/Applications/kitty.app`
3. Toggle it on
4. Fully quit and relaunch kitty

Without this permission, `CGWindowListCopyWindowInfo` returns kitty windows with empty titles, `windowid.swift` can't find the capture window, and `screencapture` silently fails. The script will appear to "run" but produce no PNGs.

### Running the pipeline

From the repo root:

```bash
find themes -maxdepth 1 -name '*.conf' -type f | sort | ./.tools/generate_themes_previews.sh
```

> **Why `find` and not `ls`?** If your shell aliases `ls` to a long-format variant (`ls -lF` etc.), the pipe sends lines like `-rw-r--r--@ ... themes/Foo.conf` instead of bare paths, and the orchestrator chokes. `find` is alias-proof.

What happens:
1. A new OS-level kitty window titled `themes` opens.
2. For each theme, the orchestrator:
   - Applies the theme via `kitty @ set-colors`
   - Sends `clear && figlet -f digital <name>.conf && unbuffer ./color_table.sh && rm <lockfile>`
   - Waits for the lockfile to be removed (signaling the subshell finished)
   - Calls `screencapture -wl<id>` against the kitty window's CGWindowID
   - Resizes to ≤1024px wide with `mogrify`
3. The capture window closes at the end.

Output: `_previews/<ThemeName>/preview.png` for every theme processed.

### Generating just one or two themes

For a small subset (e.g. when adding a single new theme):

```bash
printf 'themes/Mithril.conf\nthemes/Ithildin.conf\n' | ./.tools/generate_themes_previews.sh
```

The orchestrator reads theme paths from stdin one-per-line.

### Post-run cleanup

The orchestrator changes the global font size to 24pt during capture and restores it to 16pt at the end — **not necessarily your preferred size**. Reset if needed:
```bash
kitty @ set-font-size 14   # or whatever you use
```

After committing the new previews:
- Revert the temporary kitty.conf additions (`allow_remote_control`, `listen_on`, `hide_window_decorations`) if you don't want them permanently on.
- Move generated PNGs from `_previews/` to `previews/` (the orchestrator's output dir is `_previews/`; the repo's tracked dir is `previews/`).

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| `mogrify: unable to open image '_previews//preview.png'` and `basename: illegal option -- r` | Aliased `ls` produced long-format output | Use `find` instead of `ls` in the pipeline |
| `./windowid.swift: No such file or directory` | Old upstream bug — cwd-relative path | Fixed in `libcapture.sh` to use `$BASH_SOURCE`-relative path |
| `screencapture: no file specified` and previews are missing | `windowid.swift` returned empty — almost always Screen Recording permission missing | Grant `/Applications/kitty.app` Screen Recording permission, fully relaunch kitty |
| `windowid.swift` diagnostic shows all kitty windows with empty titles | Screen Recording permission not yet effective | Fully Cmd+Q kitty and relaunch — permission only attaches on fresh launch |
| Capture script picks the wrong window (e.g. your editing shell) | Multiple windows match | `windowid.swift` now does exact `--title themes` match only |
| `figlet: "-t" is disabled, since ioctl is not fully implemented` printed inside captures | `-t` flag needs a real tty | Removed from `generate_theme_preview.sh` |
| Pipeline is slow (~seconds per theme) | Was using `entr` for lockfile-removal sync | Replaced with a 50ms polling loop |

## Other scripts

- `convert.py`, `convert_conf.swift`, `palette.py`, `preview.py` — legacy theme-conversion utilities from the upstream repo
- `extract-vscode.sh` — pulls colors from a VS Code theme into a draft kitty.conf
- `template.conf` / `template.conf.j2` — starting templates for new themes
- `previews.sh` — interactive theme browser (cycles through `previews/*.png` with prompts)
