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
		rofi
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
		unzip
	];

	programs.steam.enable = true;
}
