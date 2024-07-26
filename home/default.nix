{ inputs, config, pkgs, personal, ... }: {  
	imports = [
		./programs
		./bin
	];
	
	home.username = "${personal.user}";
	home.homeDirectory = "/home/${personal.user}";
	home.stateVersion = "24.05";
	programs.home-manager.enable = true;
}
