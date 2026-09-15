{ config, ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      bmount = "bashmount";
      l = "ls -p --colour=auto";
      ls = "ls -p --color=auto";
      la = "ls -ap --color=auto";
      mkdirenv = "echo \"use flake\" >> .envrc && direnv allow";
      r = "ranger";
      snerp = "sudo nixos-rebuild switch"; # used to be snrs, but I just started saying 'snerp' in my head and so here we are. meep merp :3 xD
      v = "vim";
      woman = "man"; # level 3 woke
      zed = "zeditor";

    };

    # in 'PROMPT' the %1~ shows name of the current working directory, or ~ if that's the user's home directory
    # also add my scripts (found in home/bin/scripts) to the PATH, the variable that tells programs where to look when you want to run a program. sorry if 2 much detail im just trying to explain everything
    # direnv is a program for automatically enter nix flake devshells based on the current directory.
    initContent = ''
      PROMPT='%1~ :3 '
      export PATH=$PATH:$HOME/bin/
      export PATH=$PATH:$HOME/bin/vanta1
      eval "$(direnv hook zsh)"
    '';

    # don't need .zshrc cluttering up the home directory
    dotDir = "${config.xdg.configHome}/zsh";
  };
}
