{ inputs, config, lib, pkgs, ... }:

{
	## Module imports ##
	imports =
		[
			# Hardware
			./hardware-configuration.nix
			
			# Boot
			./bootloader.nix
			./desktop.nix

			# Needed settings
			./environment.nix
			./user.nix
			./network.nix
			./sound.nix
			./graphics.nix

			# Packages
			./nixvim/nixvim.nix
			./packages.nix

			# Flake modules
			inputs.nixvim.nixosModules.nixvim
			inputs.home-manager.nixosModules.home-manager
		];

	## Initialize flakes ##
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	## Initialize home-manager ##
	home-manager = {
		extraSpecialArgs = { inherit inputs; };
		users = {
			noor = import ./home/home.nix;
		};
		backupFileExtension = "backup";
		useGlobalPkgs = true;
	};

	## System settings ##
	time.timeZone = "Europe/Brussels";

	i18n.defaultLocale = "en_US.UTF-8";
	console = {
		font = "Lat2-Terminus16";
		useXkbConfig = true;
		};

	services.xserver.enable = false;

	services.xserver.xkb.layout = "be";
	# services.xserver.xkb.options = "eurosign:e,caps:escape";

	services.libinput.enable = true; # Touchpad support

	## Other options to configure ##
	
	# services.printing.enable = true; # Printing CUPS

	# networking.proxy.default = "http://user:password@proxy:port/"; # Network proxy
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	# services.openssh.enable = true;	# Enable the OpenSSH daemon.

	## Definitely leave this value alone ##
	system.stateVersion = "25.05";
}

