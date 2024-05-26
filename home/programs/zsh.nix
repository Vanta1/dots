{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "ls -a --color=auto";
      v = "vim";
      bmount = "bashmount";
      nd = "nix develop -c zsh";
      snerp = "sudo nixos-rebuild switch"; # used to be snrs, but I just started saying 'snerp' in my head and so here we are
      gedt = "cd /home/vanta/code/projects/renoired; nd"; # let's gedt
      gitp = "cd /home/vanta/code/projects/dioxus-pod; nd" # get in the pod
    };
    # in 'PROMPT' the %1~ shows name of the current working directory, or ~ if that's the user's home directory
    # also add my scripts (found in home/bin/scripts) to the PATH, the variable that tells programs where to look when you want to run a program
    initExtra = ''
      PROMPT='%1~ :3 ' 
      export PATH=$PATH:$HOME/bin/vanta1
    '';
    # don't need .zshrc cluttering up the home directory
    dotDir = ".config/zsh";
  };
}
