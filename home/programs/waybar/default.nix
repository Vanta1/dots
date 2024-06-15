{ config, pkgs, inputs, ... }: {
  programs.waybar = {
    enable = true;
    package = inputs.waybar.packages.${pkgs.system}.waybar;
  };
  
  xdg.configFile."waybar/" = {
    source = ./config;
    recursive = true; # not necessary ATM, just future proofing
  };
}