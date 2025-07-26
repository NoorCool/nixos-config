{ pkgs }:

let
	bg = $HOME/Pictures/wallpaper1.png
in

pkgs.stdenv.mkDerivation {
	name = "sddm-theme";

	src = pkgs.fetchFromGitHub {
		owner = "Keyitdev";
		repo = "sddm-astronaut-theme";
		rev = "3ef9f511fd072ff3dbb6eb3c1c499a71f338967e";
		sha256 = "0pjghj2w0gdiksb6zi04yc5r217jckknw0ijayfdimfaidkv6w6z";
	};

	installPhase = ''
		mkdir -p $out
		cp -R ./* $out/
		sed -i 's|ConfigFile="Themes/astronaut.conf"|ConfigFile="Themes/jake_the_dog.conf"|' metadata.desktop
	'';
}
