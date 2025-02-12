{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.overrideAttrs (oldAttrs: rec {
      # update this whenever vscode bugs you about an update. this way i can keep ahead of nixpkgs
      # you can find the latest version number here: https://code.visualstudio.com/updates
      version = "1.97.1";
      src = builtins.fetchurl {
        name = "VSCode_${version}_linux-x64.tar.gz";
        url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
        # when the version number is changed the sha256 hash will be out of date.
        # just copy the "got" key from the error message and replace this field.
        sha256 = "0gr2z4vzms6fv4kcc8dzc7l3inpb5hasnzdfr1zc2n4i3nl8z8vw";
      };
    });
  };
}
