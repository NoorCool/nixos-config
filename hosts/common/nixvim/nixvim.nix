{ ... }:

{
	# Main nixvim
	programs.nixvim = {
		enable = true;
		imports = [
			./plugins.nix
			./options.nix
			./keybindings.nix
		];

		colorschemes.base16 = {
			enable = true;
			colorscheme = {
				base00 = "#000000";  # background
				base01 = "#444444";  # dim background
				base02 = "#0047B3";  # selection background
				base03 = "#CCCCCC";  # comment grey
				base04 = "#FFFFFF";  # light fg
				base05 = "#FFFFFF";  # foreground
				base06 = "#FFFFFF";  # bright fg
				base07 = "#FFFFFF";  # brightest fg

				base08 = "#DB3236";  # red
				base09 = "#F2AB00";  # orange
				base0A = "#FFD74A";  # yellow
				base0B = "#319B44";  # green
				base0C = "#1FA5A0";  # cyan
				base0D = "#0047B3";  # blue
				base0E = "#7F3AAE";  # purple
				base0F = "#B470FF";  # extra accent
			};

			setUpBar = true;
		};
	};
}
