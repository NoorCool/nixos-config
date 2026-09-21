{ config, pkgs, ... }:

{
	imports = [
		./hyprland/hyprland.nix
		./hyprland/hyprlock.nix
	];

	# Home-manager settings
	home.username = "noor";
	home.homeDirectory = "/home/noor";
	home.stateVersion = "25.05";

	home.packages = with pkgs; [
		## Entertainment ##
		firefox
		spotify
		vesktop

		## Productivity ##
		obs-studio
		obsidian
		godot-mono
		zathura # pdf-viewer
		gimp # Image manipulation
		mpv # Mediaplayer
		
		## CLI goodness ##
		cbonsai # Terminal animation
		fastfetch # System fetch

		## Decoration ##
		bibata-cursors
	];

	home.sessionVariables = {
		XCURSOR_THEME = "Bibata-Modern-Ice";
		XCURSOR_SIZE = 24;
	};

	programs.home-manager.enable = true;
}
