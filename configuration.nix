{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "i915.enable_guc=3" ]; # should prob move to hardware-configuration.nix, but it's for hardware accel for jellyfin

  networking.hostName = "nixtop"; 
  networking.networkmanager.enable = true;
  networking.firewall = {
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
  };

  # for using waydroid: https://nixos.wiki/wiki/WayDroid
  virtualisation.waydroid.enable = true;

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  # Packages
  environment.systemPackages = with pkgs; [ # packages available to all users
    git
    vim
    unzip 
    exfat
    ntfs3g
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    intel-gpu-tools
  ];

  fonts.packages = with pkgs; [
    # default fonts from NixOS wiki
    dejavu_fonts
    freefont_ttf
    gyre-fonts
    liberation_ttf
    unifont
    noto-fonts-color-emoji
    # fonts i like
    fira 
    fira-code
  ];

  users.users.vanta = {
    isNormalUser = true;
    description = "Vanta1";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  services.jellyfin = {
    enable = true;
    user = "vanta";
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  
  services.upower.enable = true; # for ironbar, probably don't need if i update that to use get_battery.sh

  services.mullvad-vpn.enable = true;

  services.fwupd.enable = true;

  hardware.opengl = {
    enable = true; # need this for Hyprland to work when enabled with home-manager
    extraPackages = with pkgs; [ # TODO: clean this up, along w kernelParams and the other intel-gpu mess i made
      intel-media-driver # these are for 1
      intel-compute-runtime 
      intel-vaapi-driver 
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
  
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; }; # Force intel-media-driver

  services.tlp.enable = true; # saves so much power on my laptop

  programs.zsh.enable = true; # must be enabled in configuration.nix to be set as the default user shell, but I've configured it with home-manager
 
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  services.avahi = {
    enable = true;
    nssmdns = true; # enables '.local' addresses 
  };
  
  # Mount, trash, and other usb drive functionalities, i think i might also like to move this to hardware-configuration
  services.gvfs.enable = true; 
  services.udisks2.enable = true;
  services.devmon.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "23.11"; # ne touche pas
}
