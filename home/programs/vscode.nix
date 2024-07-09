{ pkgs, config, ... }: {
	programs.vscode = {
		enable = true;
		package = (pkgs.vscode.overrideAttrs (oldAttrs: rec {
			version = "1.90.1";
			src = builtins.fetchurl {
				name = "VSCode_${version}_linux-x64.tar.gz";
				url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
				sha256 = "039yb1v4vcgsyp3gfvsfm7pxivf20ycyvidhrk26jfm54ghbbnlz";
			};
		}));
	};
}
