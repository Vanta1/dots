{ inputs, config, pkgs, ... }: {
  imports = [
    ./zsh.nix

    # window manager / desktop stuff
    ./hyprland
    ./waybar

    # other programs
    ./firefox
    ./zathura.nix
    ./kitty.nix
    ./alacritty.nix
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
    wireplumber # wpctl - pipewire controls
    xdg-utils # open links in browser
    chromium
    feh
    moonlight-qt
  ];

  programs.obs-studio.enable = true;

  services.dunst.enable = true;

  programs.git = {
    enable = true;
    userName = "Vanta_1";
    userEmail = "mcoopersandys@gmail.com";
  };
}
