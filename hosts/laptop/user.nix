{ ... }:

{
	# System users
	users.users.noor = {
		isNormalUser = true;
		extraGroups = [ 
			"wheel"
			"networkmanager"
		];
		initialPassword = "123";
	};
}
