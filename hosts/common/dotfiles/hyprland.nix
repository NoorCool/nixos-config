{ ... }

{
	wayland.windowManager.hyprland = {
		enable = true;

		settings = {
			"$mainMod" = "SUPER";
			bind = [

			];

			bindm = [

			];

			exec-once = [
				"swaybg -i $HOME/Pictures/wallpaperAmelie.png"
				"hyprctl setcursor bibate-modern-ice 24"
			];

			env = [
				"HYPRCURSOR_THEME, bibate-modern-ice"
				"HYPRCURSOR_SIZE, 24"
			];

			decoration = {
				rounding = 0;
				rounding_power = 0;
				active_opacity = 1.00;
				inactive_opacity = 0.95;
				blur = {
					enabled = false;
				};

				shadow = {
					enabled = true;
					range = 5;
					render_power = 3;
					color = "rgb(141617)"
				};
			};

			general = {
				gaps_in = 5;
				gaps_out = 7;
				border_size = 2;
				"col.active_border" = "rgb(98971a)";
				"col.inactive_border" = "rgb(1d2021)";
				resize_on_border = true;
				allow_tearing = false;
				layout = "dwindle";
			};

			input = {
				kb_layout = "be";
				kp_options = "grp:caps_toggle";

				touchpad = {
					natural_scroll = true;
					tap-to-click = true;
					disable_while_typing = true;
					tap-and-drag = true;
				};
			};

			dwindle = {
				preserve_split = true;
				pseudotile = true;
			};
		};
	};
}
