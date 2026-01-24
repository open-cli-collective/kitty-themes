# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
