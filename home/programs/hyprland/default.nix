{ inputs, config, pkgs, ... }: {
  imports = [
    ./keybinds.nix
    ./tofi.nix
  ];

  home.packages = with pkgs; [
    tofi
    waypaper
    swaybg # backend for waypaper
    xdg-desktop-portal-hyprland # allows for screen sharing
    
    # TODO: add these unstable packages, they're not in 23.11 stable
    #hypridle
    #hyprlock 
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [ inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars ];
    
    settings = {
      # programs run once on startup
      exec-once = [ 
        "waypaper --restore"
        "waybar"
      ];

      monitor = [
        "eDP-1,1920x1200,0x0,1"
        "desc:Acer Technologies ED273 A 0x01010101,1920x1080@59.95,-320x-1440,0.75" # place my desktop monitor above my laptop, and center it (((1920 / 0.75) - 1920) / 2 = 320, 1080 / 0.75 = 1440)
      ];

      input = {
        kb_layout = "us";
        follow_mouse = "1";
        touchpad = {
          natural_scroll = "no";
        };
        sensitivity = "0";
      };

      general = {
        gaps_in = "6";
        gaps_out = "12";
        border_size = "4";
        "col.active_border" = "rgb(374145)";
        "col.inactive_border" = "rgb(272e33)";
        resize_on_border = "true";
        extend_border_grab_area = "3";
        layout = "dwindle";
        allow_tearing = "false";
      };

      dwindle = {
        no_gaps_when_only = "1";
      };

      decoration = {
        rounding = "12";
        drop_shadow = "false";
        blur = { 
          enabled = "false"; 
        };
      };

      gestures = {
        workspace_swipe = "true";
        workspace_swipe_invert = "false";
      };

      animations.enabled = "no";
      dwindle.preserve_split = "yes";
      master.new_is_master = "true";
      misc.disable_hyprland_logo = "true";
      xwayland.force_zero_scaling = "true";
    };
    
    # for some reason, home-manager puts '.extraConfig' after plugins are imported, but '.settings' before, which means plugins need to be configured in '.extraConfig'.
    extraConfig = ''
      plugin {
        hyprbars { 
          bar_height = 30
          bar_color = rgb(272e33)
          col.text = rgb(d3c6aa)
          bar_text_size = 12
	        bar_text_font = Monaspace Xenon
          bar_precedence_over_border = true
          bar_text_align = left
          bar_padding = 10
          bar_button_padding = 9
	        hyprbars-button = rgb(e67e80), 13, , hyprctl dispatch killactive
	        hyprbars-button = rgb(dbbc7f), 13, , hyprctl dispatch togglefloating
	        hyprbars-button = rgb(a7c080), 13, , hyprctl dispatch fullscreen
        }
      }
    '';
  };
}

