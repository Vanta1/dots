{pkgs, ...}: {
  # dependencies for shell scripts
  home.packages = with pkgs; [
    jq
    zscroll
  ];

  home.file."/bin/vanta1/" = {
    source = ./scripts;
    recursive = true;
  };
}
