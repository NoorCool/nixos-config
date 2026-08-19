{ ... }:

{
	# Audio settings
	services.pipewire = {
		enable = true;
		audio.enable = true;
		pulse.enable = true;
		wireplumber.enable = true;
		jack.enable = true;
		alsa = {
			enable = true;
			support32Bit = true;
		};
	};


	
	# Bluetooth settings
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};
}
