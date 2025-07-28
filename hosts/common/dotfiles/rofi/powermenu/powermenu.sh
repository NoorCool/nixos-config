#!/usr/bin/env bash

# Theme
dir="$HOME/.config/rofi/powermenu/"
theme='style'

# CMDs
uptime="$(uptime | sed 's/.*up *//; s/, *[0-9]* user.*//')"
host="$(hostname)"

# Options
shutdown='Shutdown'
reboot='Reboot'
lock='Lock'
yes='Y'
no='N'


# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "                  ⏱ Uptime: $uptime" \
		-mesg "⏱ Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 300px; height: 150px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass options to menu
run_rofi() {
	echo -e "$shutdown\n$reboot\n$lock" | rofi_cmd
}

# Execute option command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			reboot
		fi
	else
		exit 0
	fi
}

chosen="$(run_rofi)"
case ${chosen} in
				$shutdown)
								run_cmd --shutdown
						;;
				$reboot)
								run_cmd --reboot
						;;
				$lock)
								hyprlock
						;;
esac
