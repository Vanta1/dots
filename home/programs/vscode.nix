{ pkgs, config, ... }: {
	programs.vscode = {
		enable = true;
		package = (pkgs.vscode.overrideAttrs (oldAttrs: rec {
			version = "1.91.1";
			src = builtins.fetchurl {
				name = "VSCode_${version}_linux-x64.tar.gz";
				url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
				sha256 = "0ighhwwmc8cxdabq2wkzzr21sv6zaj90pnqi2cy8krfwm88w6jc0";
			};
		}));
	};
}
