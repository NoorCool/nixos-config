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

		colorschemes.everforest = {
			enable = true;
		};
	};
}
