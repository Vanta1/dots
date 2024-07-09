{ config, pkgs, user, ... }: {
	imports = [
		./hardware-configuration.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.kernelParams = [ 
		"i915.enable_guc=3" # for jellyfin hardware accelerated encoding
		"mem_sleep_default=deep"
	]; 

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

	# Packages, available to all users
	environment.systemPackages = with pkgs; [
		# basic utilities, expected linux stuff
		git
		vim
		unzip 
		exfat
		ntfs3g

		# jellyfin, this is a systemd service that's run as the default user
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
		monaspace # github's monaspace fonts, i use Xenon mostly
		input-fonts # monospace and dynamic fonts for programming and anything else. super clean <3
	];

	programs.nix-ld = {
		enable = true;
	};

	users.users.${user} = {
		isNormalUser = true;
		description = "default user, with sudo privileges";
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.zsh;
	};

	# scripts run after nixos-rebuild 
	system.activationScripts = { 
		# tofi-drun won't detect newly installed applications unless you manually delete the cache, so it has to rebuild it
		# send all output to /dev/null to suppress "file does not exist" errors, and run it in the background and discard the output because nixos-rebuild will still check the result of the command
		refresh-tofi.text = ''
		echo "refreshing tofi cache..."
		rm /home/${user}/.cache/tofi-drun &> /dev/null &!
		'';
	};

	services.jellyfin = {
		enable = true;
		user = "${user}";
	};

	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = true;
	services.blueman.enable = true;
	
	# for ironbar (deprecated), probably don't need if i update that to use get_battery.sh
	#services.upower.enable = true; 

	services.mullvad-vpn.enable = true;

	services.fwupd.enable = true;

	hardware.opengl = {
		enable = true; # need this for Hyprland to work when enabled with home-manager & steam games
		driSupport = true;
		driSupport32Bit = true;
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

	services.printing.enable = true;

	services.avahi = {
		enable = true;
		nssmdns4 = true; # enables '.local' addresses 
		openFirewall = true;
	};
	
	# Mount, trash, and other usb drive functionalities
	services.gvfs.enable = true;

	# needed for automatically mounting external usb drives with udiskie (enabled with home-manager)
	services.udisks2.enable = true; 

	# needed to install obsidian ugh
	nixpkgs.config.permittedInsecurePackages = [
		"electron-25.9.0"
	];

	nixpkgs.config.allowUnfree = true;
	nixpkgs.config.input-fonts.acceptLicense = true; # license for input-fonts: https://input.djr.com/license/. go support it's creator here!!: http://input.djr.com/buy

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	system.stateVersion = "24.05"; # ne touche pas
}
