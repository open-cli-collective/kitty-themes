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
- Auto-release triggered by `feat:` or `fix:` commits to main
- Update `CHANGELOG.md` when making significant changes

## Conventional Commits

All commits must follow conventional commit format:
- `feat:` - New theme (triggers release)
- `fix:` - Theme correction (triggers release)
- `docs:` - Documentation only
- `chore:` - Maintenance, CI/CD
- `refactor:` - Code restructuring

## CI/CD Pipeline

1. **PR opened** → Theme validation runs
2. **Merged to main** → If `feat:`/`fix:`, auto-release creates tag
3. **Tag pushed** → GitHub release created, Homebrew tap updated

## Distribution

- **Homebrew**: `brew install open-cli-collective/tap/kitty-themes`
- **Manual**: Clone repo to `~/.config/kitty/kitty-themes`
