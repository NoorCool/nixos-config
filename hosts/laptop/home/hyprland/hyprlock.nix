{ pkgs, ...}:

{

	programs.hyprlock = {
		enable = true;

		settings = {
			general = {
				hide_cursor = false;
				grace = 1;
			};

			background = {
				monitor = "eDP-1";
				path = "$HOME/.config/current-wallpaper";
				blur_passes = 2;
				contrast = 1;
				brightness = 0.5;
				vibrancy = 0.2;
				vibrancy_darkness = 0.2;
			};

			input-field = {
				monitor = "";
				size = "250, 50";
				outline_thickness = 2;
				dots_size = 0.2;
				dots_spacing = 0.35;
				dots_center = true;
				dots_rounding = -2;
				outer_color = "rgb(343F44)";
				inner_color = "rgb(D3C6AA)";
				font_color = "rgb(2D353B)";
				rounding = -1;
				fade_on_empty = false;

				placeholder_text = "Input Password";
				hide_input = false;
				position = "0, 0";

				halign = "center";
				valign = "center";
			};

			label = [
			{
				text = ''cmd[update:1000] date +"%d-%m-%Y"'';
				color = "rgb(D3C6AA)";
				font_size = 22;
				position = "0, 300";
				halign = "center";
				valign = "center";
			}

			{
				text = ''cmd[update:1000] date +"%H:%M"'';
				color = "rgb(D3C6AA)";
				font_size = 95;
				position = "0, 200";
				halign = "center";
				valign = "center";
			}
			];
		};
	};

}
