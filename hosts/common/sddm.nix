{ pkgs }:

let
	bg = pkgs.fetchurl {
		url = "https://raw.githubusercontent.com/NoorCool/wallpapers/main/wallpaperXFiles2.png";
		sha256 = "1bbya2s4a6ryga9pcgzia43lyyjzbf699rp1pa1sd8r9zyfc20ay";
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
