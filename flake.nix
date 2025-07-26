{
	description = "I use a flake on nixos btw";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		nixvim.url = "github:nix-community/nixvim";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, ... } @inputs:
		let
			system = "x86_64-linux";
		in
		{
			nixosConfigurations = {
				"laptop" = nixpkgs.lib.nixosSystem {
				system = system;
				modules = [
					./hosts/laptop/configuration.nix
				];
				pkgs = import nixpkgs {
					inherit system;
					config.allowUnfree = true;
				};
				specialArgs = { inherit inputs system; };
				};
			};
		};
}
