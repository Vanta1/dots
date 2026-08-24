{ pkgs, ... }: {
	home.packages = [ pkgs.ironbar ];
	
	xdg.configFile."ironbar/" = { 
		source = ./config;
		recursive = true;
	};
}
