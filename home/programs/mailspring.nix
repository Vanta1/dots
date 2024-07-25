{ inputs, config, pkgs, ... }:
let 
	mailspring_fixed = pkgs.mailspring.overrideAttrs (finalAttrs: previousAttrs: {
		postFixup = builtins.replaceStrings [ "Exec=$out/bin/mailspring" ] [ "Exec=\"$out/bin/mailspring --password-store=\"gnome-libsecret\"\"" ] previousAttrs.postFixup;
	});
in
{
    home.packages = [ mailspring_fixed ];
}