{ pkgs, ... }:

{
	# Greeter SDDM with default to hyprland
	services.displayManager = {
		defaultSession = "hyprland";
	};

	# Hyprland
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};
}
