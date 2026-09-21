#!/usr/bin/env bash

set -euo pipefail

dir="$HOME/.config/rofi/wallpaperselector"
theme="style"

wall_dir="$HOME/Pictures/wallpapersEF"
wall_link="$HOME/.config/current-wallpaper"

rofi_cmd() {
	rofi \
		-dmenu \
		-i \
		-show-icons \
		-no-custom \
		-p "Wallpaper" \
		-theme "${dir}/${theme}.rasi"
}

run_rofi() {
	[[ -d "$wall_dir" ]] || return 1

	find "$wall_dir" -maxdepth 1 -type f -print0 |
	while IFS= read -r -d '' file; do
		printf '%s\0icon\x1f%s\n' "$(basename "$file")" "$file"
	done |
	PREVIEW=true rofi_cmd
}

set_wallpaper() {
	local wall="$wall_dir/$1"

	[[ -f "$wall" ]] || return 1

	ln -sfn "$wall" "$wall_link"

	pkill -x swaybg 2>/dev/null || true

	swaybg -i "$wall_link" -m fill >/dev/null 2>&1 &
}

chosen="$(run_rofi || true)"

[[ -n "$chosen" ]] && set_wallpaper "$chosen"
