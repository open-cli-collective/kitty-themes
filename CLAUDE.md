# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a community-maintained fork of [dexpota/kitty-themes](https://github.com/dexpota/kitty-themes), originally created by Fabrizio Destro.

A collection of color themes for the [kitty terminal emulator](https://github.com/kovidgoyal/kitty), ported from iTerm2-Color-Schemes. Themes are kitty configuration files (`.conf`) containing color definitions.

## Repository Structure

- `themes/` - Theme configuration files (187+ themes)
- `scripts/` - Validation and utility scripts
- `.tools/` - Legacy scripts for theme conversion and preview generation
- `.github/workflows/` - CI/CD pipelines
- `CHANGELOG.md` - Release history following Keep a Changelog format

## Common Commands

```bash
# Validate all themes
./scripts/validate-themes.sh themes

# Test a theme (requires kitty remote control)
kitty @ set-colors -a "themes/ThemeName.conf"

# Test a theme (new instance)
kitty -o include="themes/ThemeName.conf"
```

## Generating preview images

See `.tools/README.md` for the full walkthrough. Quick orientation for future Claude sessions:

```bash
# Batch all themes
find themes -maxdepth 1 -name '*.conf' -type f | sort | ./.tools/generate_themes_previews.sh

# Just a subset
printf 'themes/Foo.conf\nthemes/Bar.conf\n' | ./.tools/generate_themes_previews.sh
```

Output lands in `_previews/<ThemeName>/preview.png`; the repo's tracked directory is `previews/` (rename/move after generation).

**High-friction gotchas — read `.tools/README.md` first if regenerating:**
- macOS Screen Recording permission must be granted to `/Applications/kitty.app` (not the homebrew CLI symlink), with a full kitty Cmd+Q + relaunch afterwards. Without it, the script appears to run but silently produces no PNGs.
- Don't pipe `ls themes/*.conf` — `ls` aliases break the pipeline. Use `find`.
- The orchestrator changes kitty's global font size during capture. Run `kitty @ set-font-size <N>` afterwards to restore.
- `kitty.conf` needs temporary `allow_remote_control yes`, `listen_on unix:/tmp/kitty`, and `hide_window_decorations yes` for the run.

## Theme File Format

Each theme is a `.conf` file with kitty color configuration:
- Required: `background`, `foreground`, `color0`-`color15`
- Optional: `cursor`, `cursor_text_color`, `selection_background`, `selection_foreground`, tab colors

## Versioning & Releases

- Base version in `version.txt` (e.g., `2.0`)
- Releases tagged as `v{BASE}.{RUN_NUMBER}` (e.g., `v2.0.42`)
- Auto-release triggered by `feat:` or `fix:` commits that touch `themes/**` or `version.txt`
- Bump `version.txt` for major changes (new features, breaking changes)

## Contributing Workflow

1. **Create issue** describing the change (optional for small fixes)
2. **Create branch** from `main` with conventional prefix (`feat/`, `fix/`, `docs/`)
3. **Make changes** and validate with `./scripts/validate-themes.sh themes`
4. **Update docs** as needed:
   - New themes → no README update needed (auto-counted)
   - New features → update README if user-facing
   - Releases → update CHANGELOG.md with changes
5. **Open PR** with conventional commit title
6. **Wait for CI** (theme validation + commit message check)
7. **Merge** (squash merge preferred)

## Conventional Commits

All commits must follow conventional commit format. **Never mention Claude, LLMs, or AI in commit messages or PR descriptions.**
- `feat:` - New theme (triggers release)
- `fix:` - Theme correction (triggers release)
- `docs:` - Documentation only
- `chore:` - Maintenance, CI/CD
- `refactor:` - Code restructuring

## CI/CD Pipeline

1. **PR opened** → Theme validation + commit message check
2. **Merged to main** → Auto-release runs if:
   - Commit starts with `feat:` or `fix:`
   - AND changes touch `themes/**` or `version.txt`
3. **Tag pushed** → Release workflow creates GitHub release + updates Homebrew tap

**No release triggered by:** `docs:`, `chore:`, `ci:`, `test:`, `refactor:` commits, or changes only to workflows/scripts/docs.

## Distribution

- **Homebrew**: `brew install open-cli-collective/tap/kitty-themes`
- **Manual**: Clone repo to `~/.config/kitty/kitty-themes`

## Importing from Original Repo

The original [dexpota/kitty-themes](https://github.com/dexpota/kitty-themes) has been inactive since 2019 with many unmerged PRs and open issues. We selectively import valuable contributions.

### Tracking File

`import-issues.md` tracks all original repo issues/PRs:
- **Pending** - Items to be addressed (linked to our issues)
- **Low Priority** - Items that need evaluation or manual work
- **Completed** - Items we've imported (organized by our PR)
- **Ignored** - Items we won't fix (with reasoning)

**Always check `import-issues.md` before working on original repo items to avoid duplicate work.**

### Import Process

1. **Evaluate** - Check if theme/fix is valuable and not already done
2. **Fetch config** - Use `gh api repos/dexpota/kitty-themes/pulls/XX/files --jq '.[].patch'`
3. **Create theme file** - Add `cursor_text_color` if missing
4. **Validate** - Run `./scripts/validate-themes.sh themes`
5. **Commit** - One commit per theme/fix with `Ref dexpota/kitty-themes#XX`
6. **Update tracking** - Move item to Completed in `import-issues.md`

### Commit Format for Imports

```
feat: add ThemeName theme

Ref dexpota/kitty-themes#XX
```

Or for fixes:
```
fix: correct colorX in ThemeName

Ref dexpota/kitty-themes#XX
```

Note: Use `Ref` not `Closes` - we don't have permission to close issues on the original repo, and referencing creates a link without noise.
