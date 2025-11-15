{ pkgs }:

let
	bg = pkgs.fetchurl {
		url = "https://raw.githubusercontent.com/NoorCool/wallpapers/main/wallpaperNix.png";
		sha256 = "1dp3pxbfldln4amg6rqn7n6mfqb4r46pnb78g40ngqrgm60gw4p7";
	};
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
		cp -r ${bg} $out/Backgrounds/astronaut.png
		sed -i '/PartialBlur="true"/c\PartialBlur="false"' $out/Themes/astronaut.conf
	'';
}
