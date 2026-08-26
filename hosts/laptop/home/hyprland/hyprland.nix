{ pkgs, ...}:

{
	wayland.windowManager.hyprland = {
		enable = true;

		configType = "lua";

		settings = {
			"$mainMod" = "SUPER";

			monitor = [
				"eDP-1, 2256x1504@60, 0x0, 1.33"
				"DP-1, 1920x1080@60, 0x-1080, 1.00"
			];

			"$terminal" = "kitty";
			"$menu" = "rofi -show drun";

			"exec-once" = [
				"waybar"
				"swaybg -i $HOME/.config/current-wallpaper -m fill"
				"hyprctl setcursor Bibata-Modern-Ice 24"
			];

			general = {
				gaps_in = 5;
				gaps_out = 5;
				border_size = 2;
				"col.active_border" = "rgb(A7C080)";
				"col.inactive_border" = "rgb(343F44)";
				resize_on_border = true;
				allow_tearing = false;
				layout = "dwindle";

			};
		};
	};

}
