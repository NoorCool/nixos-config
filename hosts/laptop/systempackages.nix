{ inputs, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		## General programs ##
		git
		wget # Download tool
		killall
		kitty # Terminal emulator

		## Display ##
		waybar
		rofi-wayland
		hyprshot
		wl-clipboard
		swaybg
		hyprlock
		hyprcursor
		brightnessctl

		## Fetch thingies ##
		nix-prefetch
		nix-prefetch-git

		## zip ##
		zip
	];

	programs.steam.enable = true;
}
