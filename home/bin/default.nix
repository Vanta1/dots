{pkgs, ...}: {
  # dependencies for shell scripts
  home.packages = with pkgs; [
    jq
  ];

  home.file."/bin/vanta1/" = {
    source = ./scripts;
    recursive = true;
  };
}
