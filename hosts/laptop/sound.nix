{ ... }:

{
	# Audio settings
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};
	
# Bluetooth settings
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};
}
