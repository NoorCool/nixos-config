{ pkgs, ... }:

{
	# Greeter SDDM with default to hyprland
	services.displayManager = {
		defaultSession = "hyprland";
		sddm = {
			enable = true;
			package = pkgs.kdePackages.sddm;
			wayland.enable = true;
			theme = "${import ../common/sddm.nix {inherit pkgs; }}";
			extraPackages = with pkgs; [
				kdePackages.waylib
				kdePackages.qt6ct
				kdePackages.qtsvg
				kdePackages.qtvirtualkeyboard
				kdePackages.qtmultimedia
			];
		};
	};

	# Hyprland
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};
}
