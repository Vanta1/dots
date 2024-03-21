{ inputs, config, pkgs, ... }: {
  imports = [
    ./zsh.nix

    ./hyprland
    ./ironbar

    ./firefox.nix
    ./zathura.nix
    ./kitty.nix
  ];

  home.packages = with pkgs; [
    neofetch
    which
    tree
    gnupg
    btop
    acpi
    vscode
    brightnessctl
    gammastep
    pcmanfm
    qbittorrent
    wf-recorder
    vlc
    chromium
    wireplumber
  ];

  programs.obs-studio.enable = true;

  services.dunst.enable = true;

  programs.git = {
    enable = true;
    userName = "Vanta_1";
    userEmail = "mcoopersandys@gmail.com";
  };
}
