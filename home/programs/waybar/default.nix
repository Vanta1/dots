{ config, pkgs, ... }: {
  programs.waybar.enable = true;
  
  xdg.configFile."waybar/" = {
    source = ./config;
    recursive = true; # not necessary ATM, just future proofing
  };
}