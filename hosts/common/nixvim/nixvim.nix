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

		colorschemes.gruvbox = {
			enable = true;
		};
	};
}
