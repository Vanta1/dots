{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "ls -a --color=auto";
      v = "vim";
      bmount = "bashmount";
      nd = "nix develop -c zsh";
      snerp = "sudo nixos-rebuild switch"; # used to be snrs, but I just started saying 'snerp' in my head and so here we are
    };
    initExtra = ''
      PROMPT='%1~  ' 
      export PATH=$PATH:$HOME/bin/vanta1
    '';
    dotDir = ".config/zsh";
  };
}
