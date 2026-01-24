#!/usr/bin/env bash
# Validates kitty theme configuration files
# Checks for required keys and valid hex color format

set -euo pipefail

THEMES_DIR="${1:-themes}"
EXIT_CODE=0

# Required keys for a valid kitty theme
REQUIRED_KEYS=(
    "background"
    "foreground"
    "color0"
    "color1"
    "color2"
    "color3"
    "color4"
    "color5"
    "color6"
    "color7"
    "color8"
    "color9"
    "color10"
    "color11"
    "color12"
    "color13"
    "color14"
    "color15"
)

# Validate hex color format (#RGB, #RRGGBB, or #RRGGBBAA)
validate_hex_color() {
    local color="$1"
    if [[ ! "$color" =~ ^#([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$ ]]; then
        return 1
    fi
    return 0
}

# Check if a theme file has all required keys
validate_theme() {
    local file="$1"
    local theme_name
    theme_name=$(basename "$file" .conf)
    local errors=()

    # Check for required keys
    for key in "${REQUIRED_KEYS[@]}"; do
        if ! grep -qE "^${key}[[:space:]]+" "$file"; then
            errors+=("Missing required key: $key")
        fi
    done

    # Validate color values
    while IFS= read -r line; do
        # Skip comments and empty lines
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        [[ -z "${line// }" ]] && continue

        # Extract key and value
        if [[ "$line" =~ ^([a-z_0-9]+)[[:space:]]+(.+)$ ]]; then
            local key="${BASH_REMATCH[1]}"
            local value="${BASH_REMATCH[2]}"

            # Only validate color-related keys
            if [[ "$key" =~ ^(background|foreground|cursor|cursor_text_color|selection_background|selection_foreground|color[0-9]+|active_tab_background|active_tab_foreground|inactive_tab_background|inactive_tab_foreground)$ ]]; then
                if ! validate_hex_color "$value"; then
                    errors+=("Invalid hex color for $key: $value")
                fi
            fi
        fi
    done < "$file"

    # Report errors
    if [[ ${#errors[@]} -gt 0 ]]; then
        echo "❌ $theme_name:"
        for error in "${errors[@]}"; do
            echo "   - $error"
        done
        return 1
    else
        echo "✓ $theme_name"
        return 0
    fi
}

echo "Validating themes in $THEMES_DIR..."
echo

# Find and validate all theme files
for theme_file in "$THEMES_DIR"/*.conf; do
    if [[ -f "$theme_file" ]]; then
        if ! validate_theme "$theme_file"; then
            EXIT_CODE=1
        fi
    fi
done

echo
if [[ $EXIT_CODE -eq 0 ]]; then
    echo "All themes validated successfully!"
else
    echo "Some themes have validation errors."
fi

exit $EXIT_CODE
