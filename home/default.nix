{personal, ...}: {
  imports = [
    ./programs
    ./bin
  ];

  home.username = "${personal.user}";
  home.homeDirectory = "/home/${personal.user}";
  home.stateVersion = "24.05"; # this does not need to be updated between system upgrades
  programs.home-manager.enable = true;
}
