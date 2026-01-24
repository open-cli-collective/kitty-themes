## Summary

<!-- Briefly describe what this PR does -->

## Type of Change

- [ ] `feat:` New theme
- [ ] `fix:` Theme correction/fix
- [ ] `docs:` Documentation update
- [ ] `chore:` Maintenance (CI, tooling, etc.)

## PR Title Format

**Your PR title must follow conventional commit format:**

- `feat: add Catppuccin theme`
- `fix: correct Solarized Dark colors`
- `docs: update installation instructions`
- `chore: update CI workflow`

## Checklist

- [ ] Theme file is in `themes/` directory with `.conf` extension
- [ ] Theme includes all required color keys (background, foreground, color0-color15)
- [ ] All color values are valid hex format (#RGB, #RRGGBB, or #RRGGBBAA)
- [ ] Theme has been tested in kitty terminal
- [ ] If porting from another source, licensing allows redistribution

## Testing

**Test your theme locally:**

```bash
# Validate theme format
./scripts/validate-themes.sh themes

# Preview in kitty (requires remote control)
kitty @ set-colors -a "themes/YourTheme.conf"

# Or start new instance
kitty -o include="themes/YourTheme.conf"
```
