{ inputs, config, pkgs, ... }: {
  imports = [
    # shell
    ./zsh.nix

    # window manager / desktop stuff
    ./hyprland # window manager
    ./waybar # status bar

    # other programs
    ./firefox # web browser
    ./zathura.nix # pdf viewer w/ vim like controls
    ./alacritty.nix # terminal emulator
    ./gtk # gtk theming
    ./vscode.nix # ide
    ./discord.nix # we all know what discord is
  ];

  home.packages = with pkgs; [
    neofetch # display system info for rice posts
    which
    tree
    gnupg
    btop # system monitor
    acpi # power info
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
    thunderbird # email, calendar, todo
    protonup # steam proton installer
    gtk-engine-murrine # for everforest theme 
    obsidian # note taking app
    blender # 3D modeling
  ];

  # from: https://github.com/vimjoyer/nixos-gaming-video
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\\\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.obs-studio.enable = true;

  services.flameshot.enable = true; # broken screenshot tool
  services.dunst.enable = true; # notification daemon

  programs.git = {
    enable = true;
    userName = "Vanta_1";
    userEmail = "mcoopersandys@gmail.com";
  };
}
