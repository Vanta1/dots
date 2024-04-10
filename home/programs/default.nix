{ inputs, config, pkgs, ... }: {
  imports = [
    ./zsh.nix

    # window manager / desktop stuff
    ./hyprland
    ./waybar

    # other programs
    ./firefox
    ./zathura.nix
    ./alacritty.nix
  ];

  home.packages = with pkgs; [
    neofetch
    which
    tree
    gnupg
    btop # system monitor
    acpi # power info
    vscode
    brightnessctl 
    gammastep 
    pcmanfm # file manager
    qbittorrent # torrenting
    wf-recorder
    vlc
    wireplumber # wpctl - pipewire controls
    xdg-utils # open links in browser
    chromium # i use firefox, but google earth studio is chrome only
    feh # image viewer
    moonlight-qt
    minecraft # mining and crafting game
    grim # screenshot util
    musescore # sheet music software
    discord # we all know what discord is
  ];

  programs.obs-studio.enable = true;

  services.dunst.enable = true;

  programs.git = {
    enable = true;
    userName = "Vanta_1";
    userEmail = "mcoopersandys@gmail.com";
  };
}
