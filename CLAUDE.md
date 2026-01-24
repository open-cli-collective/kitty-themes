# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a community-maintained fork of [dexpota/kitty-themes](https://github.com/dexpota/kitty-themes), originally created by Fabrizio Destro.

A collection of color themes for the [kitty terminal emulator](https://github.com/kovidgoyal/kitty), ported from iTerm2-Color-Schemes. Themes are kitty configuration files (`.conf`) containing color definitions.

## Repository Structure

- `themes/` - Theme configuration files (180+ themes)
- `.tools/` - Scripts for theme conversion and preview generation

## Theme File Format

Each theme is a `.conf` file with kitty color configuration:
- `background`, `foreground`, `cursor`, `selection_background`, `selection_foreground`
- `color0`-`color7` (normal colors: black, red, green, yellow, blue, magenta, cyan, white)
- `color8`-`color15` (bright variants)
- Optional: `cursor_text_color`, tab colors (`active_tab_foreground`, etc.)

## Adding a New Theme

1. Create a `.conf` file in `themes/` with proper color values
2. Use existing themes as reference for the format

## Tools (in .tools/)

- `convert.py` - Converts JSON theme files to kitty `.conf` format using Jinja2 templates
- `generate_theme_preview.sh` / `generate_themes_previews.sh` - Generate preview images
- `extract-vscode.sh` - Extract themes from VS Code
- `palette.py` - Color palette utilities

## Testing a Theme

With kitty remote control enabled:
```bash
kitty @ set-colors -a "themes/ThemeName.conf"
```

Or start a new kitty instance:
```bash
kitty -o include="themes/ThemeName.conf"
```
