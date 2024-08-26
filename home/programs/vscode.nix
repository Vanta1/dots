{ pkgs, ... }: {
	programs.vscode = {
		enable = true;
		package = (pkgs.vscode.overrideAttrs (oldAttrs: rec {
			version = "1.92.2";
			src = builtins.fetchurl {
				name = "VSCode_${version}_linux-x64.tar.gz";
				url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
				sha256 = "0kfkn40a44ql6j4c8a1rsw5bqysj0i5k3qllq1rl2zglfx7v4vkk";
			};
		}));
	};
}
