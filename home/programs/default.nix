{ inputs, config, pkgs, personal, ... }: {
	imports = [
		# shell
		./zsh.nix

		# window manager / desktop stuff
		./hyprland # window manager
		./tofi.nix # app launcher
		./waybar.nix # status bar

		# other programs
		./alacritty.nix # terminal emulator
		./dunst.nix # notification daemon
		./gtk # gtk theming
		./firefox # web browser
		./vscode.nix # ide
		./zathura.nix # pdf viewer w/ vim like controls
	];

	home.packages = with pkgs; [
		acpi # power info
		brightnessctl # backlight control
		btop # system monitor
		blender # 3D modeling
		chromium # i use firefox, but google earth studio is chrome only
		feh # image viewer
		gammastep # screen temperature/white balance
		gnupg # encryption
		grim # screenshot utility
		gtk-engine-murrine # for everforest theme
		# email client, patched bc enabling gnome.gnome-keyring doesn't work (despite what the mailspring website says)
		(pkgs.mailspring.overrideAttrs (final: previous: {
			postFixup = builtins.replaceStrings [ "Exec=$out/bin/mailspring" ] [ "Exec=\"$out/bin/mailspring --password-store=\"gnome-libsecret\"\"" ] previous.postFixup;
		})) 
		# minecraft # mining and crafting game TODO: broken
		musescore # sheet music software
		moonlight-qt # remote desktop/gaming
		numbat # scientific calculator
		neofetch # display system info for rice posts
		obsidian # note taking app
		pcmanfm # file manager
		protonup # steam proton installer
		qbittorrent # torrenting
		slurp # for selecting parts of the screen
		tree # display contents of a directory as a file tree
		vesktop # discord client that actually works
		vlc # media player
		which # find locations of executables
		wf-recorder # for screen sharing (still not working)
		xdg-utils # open links in browser
		zed-editor # code editor (alpha release) (its seriously pretty rough on NixOS atm)
		spotify # music streaming service 
		spicetify-cli # cli for configuring the spotify client
		playerctl # useful tui for controlling media
		github-desktop # github native ui
	];

	# from: https://github.com/vimjoyer/nixos-gaming-video
	home.sessionVariables = {
		STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\\\${HOME}/.steam/root/compatibilitytools.d";
	};

	# automatically enter nix devshells when changing working directory 
	# (w/ vscode integration using the Nix Environment Selector extension)
	programs.direnv = {
		enable = true;
		enableZshIntegration = true;
		nix-direnv.enable = true;
	};

	programs.git = {
		enable = true;
		lfs.enable = true; # for github-desktop, lfs = large file storage
		userName = personal.user-name;
		userEmail = personal.user-email;
	};

	programs.obs-studio.enable = true; 

	services.gnome-keyring.enable = true; # keep it secret
	services.udiskie.enable = true; # disk mount util
}
