{pkgs, ...}: {
  imports = [
    # shell
    ./zsh.nix

    # window manager / desktop stuff
    ./hyprland # window manager
    ./onagre # app launcher (testing)
    ./waybar.nix # status bar

    # other programs
    ./alacritty.nix # terminal emulator
    ./dunst.nix # notification daemon
    ./gtk # gtk theming
    ./firefox # web browser
    #./spicetify.nix # spotify retheming, currently broken
    ./sherlock.nix
    ./vesktop.nix # discord retheming
    ./vscode.nix # ide
    ./wob.nix # volume/brightness indicator
    ./zathura.nix # pdf viewer w/ vim like controls
  ];

  home.packages = with pkgs; [
    acpi # power info
    alejandra # nix formatter
    audacity # audio editor
    brightnessctl # backlight control
    btop # system monitor
    blanket # background noise
    blender # 3D modeling
    chromium # i use firefox, but google earth studio is chrome only, and it fucking breaks everything
    ddcutil # control external monitors
    devenv # super easy development environments, esp w/ direnv
    feh # image viewer
    filezilla # graphical ftp client
    gammastep # screen temperature/white balance
    gh # github cli
    github-desktop # github native ui
    gnupg # encryption
    grim # screenshot utility
    # email client, patched bc enabling gnome.gnome-keyring doesn't work (despite what the mailspring website says)
    # (pkgs.mailspring.overrideAttrs (final: previous: {
    #   postFixup = builtins.replaceStrings ["Exec=$out/bin/mailspring"] ["Exec=\"$out/bin/mailspring --password-store=\"gnome-libsecret\"\""] previous.postFixup;
    # }))
    jmtpfs # media transfer protocol implementation
    kdePackages.qtsvg # for dolphin
    kid3 # audio file tagger
    kondo # file cleaner upper for my massive cargo projects
    # minecraft # mining and crafting game TODO: broken
    musescore # sheet music software
    moonlight-qt # remote desktop/gaming
    nemo-with-extensions # file manager
    neofetch # display system info for rice posts
    networkmanagerapplet # tray icon
    nil # nix language server
    numbat # scientific calculator
    obsidian # note taking app
    parallel-disk-usage # visual disk usage analyzer
    playerctl # useful tui for controlling media
    protonup # steam proton installer
    qbittorrent # torrenting
    quodlibet-full # audio player, w/ extensions
    ranger # tui file manager
    slurp # for selecting parts of the screen
    spotify # remove this if using spicetify!!
    thunderbird # email client
    tree # display contents of a directory as a file tree
    typst # L_aT_eX like formatter, with rust-y stuff i like
    vesktop # discord client that actually works
    vlc # media player
    which # find locations of executables
    wf-recorder # for screen sharing (still not working)
    wl-clipboard # clipboard utilities (wl-copy & wl-paste)
    xdg-user-dirs # manage user directories, see xdg.configFile."user-dirs.dirs"
    xdg-utils # open links in browser
    zed-editor # code editor (alpha release) (its seriously pretty rough on NixOS atm) (and only available on nixpkgs/unstable)
  ];

  # from: https://github.com/vimjoyer/nixos-gaming-video
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\\\${HOME}/.steam/root/compatibilitytools.d";
  };

  # i prefer lowercase directory names ¯\_(ツ)_/¯
  xdg.configFile."user-dirs.dirs".text = ''
    XDG_DESKTOP_DIR="$HOME/desktop"
    XDG_DOWNLOAD_DIR="$HOME/downloads"
    XDG_PUBLICSHARE_DIR="$HOME/public"
    XDG_DOCUMENTS_DIR="$HOME/documents"
    XDG_MUSIC_DIR="$HOME/music"
    XDG_PICTURES_DIR="$HOME/pictures"
    XDG_VIDEOS_DIR="$HOME/videos"
    XDG_TEMPLATES_DIR="$HOME/templates"
  '';

  # automatically enter nix devshells when changing working directory
  # (w/ vscode integration using the direnv extension)
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.obs-studio = {
    enable = true;
    plugins = [
      #pkgs.obs-studio-plugins.wlrobs
    ];
  };

  services.gnome-keyring.enable = true; # keep it secret
  services.udiskie.enable = true; # disk mount util

  # "Nemo" doesn't show up in tofi for some reason, even after refreshing cache
  xdg.desktopEntries.nemo = {
    name = "Nemo";
    exec = "nemo";
    terminal = false;
  };
}
