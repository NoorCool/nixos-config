{ pkgs, ... }:

{
	# System environment variables
	environment.sessionVariables = {
		NIXOS_OZONE_WL = "1";
		XDG_SESSION_TYPE = "wayland";
		XDG_SESSION_DESKTOP = "hyprland";
		GODOT_DISPLAY_DRIVER = "wayland";
		XCURSOR_THEME = "Bibata-Modern-Ice";
		XCURSOR_SIZE  = "24";
		MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
	};
}
	
