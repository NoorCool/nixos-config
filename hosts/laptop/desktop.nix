{ pkgs, ... }:

{
	# Greeter SDDM with default to hyprland
	services.displayManager = {
		defaultSession = "hyprland";
		sddm = {
			enable = true;
			package = pkgs.kdePackages.sddm;
			wayland.enable = true;
		};
	};

	# Hyprland
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};
}
