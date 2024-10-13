{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.overrideAttrs (oldAttrs: rec {
      # update this whenever vscode bugs you about an update. this way i can keep ahead of nixpkgs
      version = "1.94.2";
      src = builtins.fetchurl {
        name = "VSCode_${version}_linux-x64.tar.gz";
        url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
        # when the version number is changed the sha256 hash will be out of date.
        # just copy the "got" key from the error message and replace this field.
        sha256 = "0w452wnzyb4wmr2qqq55dhfb1jd0zqmwf65fbmxdz7jn1jimjjrn";
      };
    });
  };
}
