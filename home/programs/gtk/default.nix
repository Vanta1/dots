{ config, pkgs, ... }: {
    xdg.configFile."gtk-4.0/" = {
        source = ./gtk-4.0;
        recursive = true; 
    };
}