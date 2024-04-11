{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "ls -a --color=auto";
      v = "vim";
      bmount = "bashmount";
      nd = "nix develop -c zsh";
    };
    initExtra = ''
      PROMPT='%1~ :3 ' 
      export PATH=$PATH:$HOME/bin/vanta1
    '';
    dotDir = ".config/zsh";
  };
}
