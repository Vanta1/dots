{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.overrideAttrs (oldAttrs: rec {
      # update this whenever vscode bugs you about an update. this way i can keep ahead of nixpkgs
      # you can find the latest version number here: https://code.visualstudio.com/updates
      # or by clicking on "Release Notes" in the update notif
      version = "1.98.0";
      src = builtins.fetchurl {
        name = "VSCode_${version}_linux-x64.tar.gz";
        url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
        # when the version number is changed the sha256 hash will be out of date.
        # just copy the "got" key from the error message and replace this field.
        sha256 = "1yywjdpdv2y71mdja7pzfj15vdrv1wj6r8k7a8n8sldk1blv0d1s";
      };
    });
  };
}
