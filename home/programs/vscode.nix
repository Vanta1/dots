{ pkgs, config, ... }: {
  programs.vscode = {
    enable = true;
    package = (pkgs.vscode.overrideAttrs (oldAttrs: rec {
      version = "1.89.1";
      src = builtins.fetchurl {
        name = "VSCode_${version}_linux-x64.tar.gz";
        url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
        sha256 = "1zfh48g6prjhjcyrz5impsnm6khw7s75k8k54bp0cszl81ddsysx";
      };
    }));
  };
}
