{ config, pkgs, ... }: {
	programs.zsh = {
		enable = true;
		shellAliases = {
			ls = "ls -a --color=auto";
			v = "vim";
			bmount = "bashmount";
			snerp = "sudo nixos-rebuild switch"; # used to be snrs, but I just started saying 'snerp' in my head and so here we are
			mkdirenv = "echo \"use flake\" >> .envrc && direnv allow"; 		
		};

		# in 'PROMPT' the %1~ shows name of the current working directory, or ~ if that's the user's home directory
		# also add my scripts (found in home/bin/scripts) to the PATH, the variable that tells programs where to look when you want to run a program. sorry if 2 much detail im just trying to explain everything
		# direnv is a program for automatically enter nix flake devshells based on the current directory.
		initExtra = ''
			PROMPT='%1~ :3 ' 
			export PATH=$PATH:$HOME/bin/vanta1
			eval "$(direnv hook zsh)" 
		'';
		# don't need .zshrc cluttering up the home directory
		dotDir = ".config/zsh";
	};
}
