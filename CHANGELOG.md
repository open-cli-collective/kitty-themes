# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- **Mithril** light theme — cool near-white background, vibrant accents, ≥4.5:1 contrast on all ANSI colors except intentionally-muted `color7`. Fixes readability issues common to the upstream `Github` theme (invisible whites, near-invisible yellow `color3`, white-on-pale-blue selection).
- **Ithildin** dark theme — coordinated dark counterpart to Mithril. Silver foreground (vs. khaki/cream in older themes), brighter cool accents, deep stone background.
- All theme preview images now hosted in-repo under `previews/<ThemeName>/preview.png`. README image references migrated from the upstream `dexpota/kitty-themes-website` repo (inactive since 2019) to relative paths. Defensive measure in case the upstream repo goes away.
- `.tools/README.md` now documents the full preview-generation pipeline including prerequisites, macOS Screen Recording permission, troubleshooting, and the canonical batch command.

### Fixed
- `.tools/libcapture.sh` — `windowid.swift` is now found relative to `libcapture.sh`'s own directory instead of cwd, so the capture pipeline works from any working directory.
- `.tools/generate_themes_previews.sh` — replaced deprecated `kitty @ new-window --window-type os` with `kitty @ launch --type=os-window`. The deprecated form was silently creating splits instead of OS-level windows in modern kitty.
- `.tools/generate_theme_preview.sh` — removed `figlet -t` flag that was emitting `"-t" is disabled, since ioctl is not fully implemented` into every captured preview.
- `.tools/windowid.swift` — now exits non-zero and prints a diagnostic list of all kitty windows when no match is found, instead of silently producing empty output.
- Fixed typo `Genereting` → `Generating` in preview-generation output.

### Changed
- Replaced `entr`-based lockfile-removal sync in preview generation with a 50ms polling loop. Faster (sub-second per theme vs. multi-second) and drops `entr` as a dependency.

## [2.0.3] - 2025-01-24

### Added
- Homebrew distribution via `brew install open-cli-collective/tap/kitty-themes`
- CI/CD pipeline with automated releases on `feat:` and `fix:` commits
- Theme validation script (`scripts/validate-themes.sh`)
- Conventional commit enforcement in CI
- PR template with contribution checklist

### Changed
- Forked to [open-cli-collective](https://github.com/open-cli-collective) organization
- Default branch renamed from `master` to `main`
- Updated all repository URLs to new organization

### Fixed
- Added `cursor_text_color` to Dracula theme for better visibility
- Added `cursor_text_color` to Solarized Dark theme

## [1.0.0] - 2019-06-27

Initial release by [Fabrizio Destro](https://github.com/dexpota).

### Added
- 169 themes ported from [iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)
- Conda distribution via conda-forge
- Theme preview images
