{ inputs, config, pkgs, user, ... }: {
    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
                disable_loading_bar = true;
                hide_cursor = true;
                no_fade_in = true;
            };
            background = {
                monitor = ""; # leave empty for all monitors
                path = "/home/${user}/wallpapers/mist_forest_2.png";
                blur_passes = 2;
            };
        };
    };
}