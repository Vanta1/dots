{ inputs, config, pkgs, user, ... }: {  
  imports = [
    ./programs
    ./bin
  ];
  
  services.udiskie.enable = true;
  
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
