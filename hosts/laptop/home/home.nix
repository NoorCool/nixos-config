{ config, pkgs, ... }:

{
	imports = [
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
		obsidian
		godot
		zathura # pdf-viewer
		
		## CLI goodness ##
		cbonsai # Terminal animation

		## Decoration ##
		bibata-cursors
	];

	gtk = {
		enable = true;

		cursorTheme = {
			name = "Bibata-Modern-Ice";
			package = home.packages.bibata-cursors;
			size = 24;
		}
	};

	home.sessionVariables = {
		XCURSOR_THEME = "Bibata-Modern-Ice";
		XCURSOR_SIZE = 24;
	};

	programs.home-manager.enable = true;
}
