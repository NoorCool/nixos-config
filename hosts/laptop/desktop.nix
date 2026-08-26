{ pkgs, ... }:

{
	services.displayManager = {
		defaultSession = "hyprland";
	};

	# Hyprland
	programs.hyprland = {
		enable = true;
		withUWSM = true;
		xwayland.enable = true;
	};

}
