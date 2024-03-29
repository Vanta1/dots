{ config, pkgs, ... }: {
  programs.waybar.enable = true;
  
  home.file."${config.xdg.configHome}/waybar/" = {
    source = ./config;
    recursive = true; # not necessary ATM, just future proofing
  };
}