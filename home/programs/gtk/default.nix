{ pkgs, ... }: {
	# home-manager.service fails when it can't find 'ca.desrt.dconf'
	# https://github.com/nix-community/home-manager/issues/3113
	home.packages = [ pkgs.dconf ];

	gtk = {
		enable = true;

		iconTheme = {
			name = "Papirus-Dark";
			package = pkgs.catppuccin-papirus-folders;
		};
	};

	xdg.configFile."gtk-4.0/" = {
		source = ./gtk-4.0;
		recursive = true; 
	};
}