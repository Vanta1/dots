{
  pkgs,
  personal,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [
    "i915.enable_guc=3" # for jellyfin hardware accelerated encoding
    "mem_sleep_default=deep"
  ];
  # having some audio issues https://github.com/NixOS/nixpkgs/issues/330685
  # linux 6.10.3 is patched for this issue
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_10;

  networking.hostName = "nixtop";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedUDPPorts = [
      53559 # jellyfin
    ];
    allowedTCPPorts = [
      53559 # jellyfin
    ];
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # for using waydroid: https://nixos.wiki/wiki/WayDroid
  virtualisation.waydroid.enable = true;

  time.timeZone = personal.time-zone;
  i18n.defaultLocale = personal.default-locale;

  # packages available to all users
  environment.systemPackages = with pkgs; [
    # basic utilities, expected linux stuff
    exfat
    git
    ntfs3g
    unzip
    vim
    bat

    # jellyfin
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    intel-gpu-tools

    # needed for gnome-keyring
    libsecret

    # other
    greetd.tuigreet
  ];

  fonts.packages = with pkgs; [
    # default fonts from NixOS wiki
    dejavu_fonts
    freefont_ttf
    gyre-fonts
    liberation_ttf
    noto-fonts-color-emoji
    unifont

    # fonts i like
    cardo # i've heard claims online that this is font used for Patrick Rothfuss' "Name of the Wind"
    departure-mono # pixel font
    input-fonts # monospace and dynamic fonts for programming and anything else. super clean <3
    monaspace # github's monaspace fonts, i use Xenon mostly

    ## very common nerd multipurpose code/nerd font.
    fira
    fira-code

    # fonts i need
    font-awesome
  ];

  programs.nix-ld.enable = true;

  # hyprland's settings are controlled with home-manager, in file:///etc/nixos/home/programs/hyprland/default.nix
  # but the portal is set here.
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  users.users.${personal.user} = {
    isNormalUser = true;
    description = "default user, with sudo privileges";
    extraGroups = ["networkmanager" "wheel" "uinput"];
    shell = pkgs.zsh;
  };

  # scripts run after nixos-rebuild
  system.activationScripts = {
    # tofi-drun won't detect newly installed applications unless you manually delete the cache, so that it has to rebuild it
    # send all output to /dev/null to suppress "file does not exist" errors, and run it in the background and discard the output because nixos-rebuild will still check the result of the command
    refresh-tofi.text = ''
      echo "refreshing tofi cache..."
      rm /home/${personal.user}/.cache/tofi-drun &> /dev/null &!
    '';
  };

  services.jellyfin = {
    enable = true;
    user = "${personal.user}";
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  hardware.steam-hardware.enable = true;

  # for controlling external monitors
  hardware.i2c.enable = true;

  # for ironbar (deprecated), probably don't need if i update that to use get_battery.sh
  #services.upower.enable = true;

  services.mullvad-vpn.enable = true;

  services.fwupd.enable = true;

  services.fprintd.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  hardware.graphics = {
    enable = true; # need this for Hyprland to work when enabled with home-manager & steam games
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # these are for jellyfin mostly
      intel-compute-runtime
      intel-vaapi-driver
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD"; # Force intel-media-driver
    NIXOS_OZONE_WL = "1"; # force vscode to run under wayland
  };

  # saves so much power on my laptop
  services.tlp.enable = true;

  # must be enabled in configuration.nix to be set as the default user shell, but I've configured it with home-manager
  programs.zsh.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  programs.gamemode.enable = true;

  programs.xwayland.enable = true;

  services.printing.enable = true;

  # hardware.uinput.enable = true;
  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
           caps
           \
          )
          (deflayer base
           (tap-hold 150 150 esc lctl)
           (tap-hold 150 150 \ lmet)
          )
        '';
      };
    };
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true; # enables '.local' addresses
    openFirewall = true;
  };

  # Mount, trash, and other usb drive functionalities
  services.gvfs.enable = true;

  # needed for automatically mounting external usb drives with udiskie (enabled with home-manager)
  services.udisks2.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    # needed to install obsidian ugh
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
    input-fonts.acceptLicense = true; # license for input-fonts: https://input.djr.com/license/. go support it's creator here!!: http://input.djr.com/buy
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = ["root" "${personal.user}"];
  };

  system.stateVersion = "23.11"; # ne touche pas
}
