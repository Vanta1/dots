{ config, pkgs, ... }: {
  programs.zsh.enable = true;
  programs.zsh.shellAliases = {
    ls = "ls -a --color=auto";
    v = "vim";
    bmount = "bashmount";
  };
  programs.zsh.initExtra = ''
     PROMPT='%1~ :3 ' 
     export PATH=$PATH:$HOME/bin/vanta1
  '';
  programs.zsh.dotDir = ".config/zsh";
}
