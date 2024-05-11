{ inputs, config, pkgs, ... }: {
  imports = [
    ./zsh.nix # shell

    # window manager / desktop stuff
    ./hyprland # window manager
    ./waybar # status bar

    # other programs
    ./firefox # web browser
    ./zathura.nix # pdf viewer w/ vim like controls
    ./alacritty.nix # terminal emulator
  ];

  home.packages = with pkgs; [
    neofetch # display system info for rice posts
    which
    tree
    gnupg
    btop # system monitor
    acpi # power info
    vscode # ide
    brightnessctl # backlight control
    gammastep 
    pcmanfm # file manager
    qbittorrent # torrenting
    wf-recorder
    vlc # media player
    wireplumber # wpctl - pipewire (audio server) controls
    xdg-utils # open links in browser
    chromium # i use firefox, but google earth studio is chrome only
    feh # image viewer
    moonlight-qt # remote desktop/gaming
    minecraft # mining and crafting game
    grim # screenshot utility
    musescore # sheet music software
    discord # we all know what discord is
    thunderbird # email, calendar, todo
  ];

  programs.obs-studio.enable = true;

  services.dunst.enable = true; # notification daemon

  programs.git = {
    enable = true;
    userName = "Vanta_1";
    userEmail = "mcoopersandys@gmail.com";
  };
}
