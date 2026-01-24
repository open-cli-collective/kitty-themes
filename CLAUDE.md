# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a community-maintained fork of [dexpota/kitty-themes](https://github.com/dexpota/kitty-themes), originally created by Fabrizio Destro.

A collection of color themes for the [kitty terminal emulator](https://github.com/kovidgoyal/kitty), ported from iTerm2-Color-Schemes. Themes are kitty configuration files (`.conf`) containing color definitions.

## Repository Structure

- `themes/` - Theme configuration files (169+ themes)
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

All commits must follow conventional commit format:
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
