{ inputs, config, pkgs, ... }: {  
  imports = [
    ./programs
    ./bin
  ];
  
  services.udiskie.enable = true;
  
  home.username = "vanta";
  home.homeDirectory = "/home/vanta";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
