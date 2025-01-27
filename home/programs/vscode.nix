{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.overrideAttrs (oldAttrs: rec {
      # update this whenever vscode bugs you about an update. this way i can keep ahead of nixpkgs
      # you can find the latest version number here: https://code.visualstudio.com/updates
      version = "1.96.4";
      src = builtins.fetchurl {
        name = "VSCode_${version}_linux-x64.tar.gz";
        url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
        # when the version number is changed the sha256 hash will be out of date.
        # just copy the "got" key from the error message and replace this field.
        sha256 = "12606f4b6drp9gnb2y6q8b9zd1q7pjqg4ikjsfz47wgsi4009096";
      };
    });
  };
}
