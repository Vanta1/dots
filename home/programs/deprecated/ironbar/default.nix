{ inputs, config, pkgs, ... }: {
  home.packages = [ pkgs.ironbar ];
  
  home.file."${config.xdg.configHome}/ironbar/" = { 
    source = ./config;
    recursive = true;
  };
}
