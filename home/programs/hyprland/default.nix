{pkgs, ...}: {
  imports = [
    ./keybinds.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];

  home.packages = with pkgs; [
    tofi
    waypaper
    swaybg # backend for waypaper
    xdg-desktop-portal-hyprland # allows for screen sharing
    xdg-desktop-portal-gtk
    hypridle
    hyprlock
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland; # inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [pkgs.hyprlandPlugins.hyprbars];

    settings = {
      # environment variables
      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        # "AQ_DRM_DEVICES,/dev/dri/card1" for broken hyprland-git
      ];

      # programs run once on startup
      exec-once = [
        "waypaper --restore" # restore previous wallpaper
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.2" # set volume to 20 (nice default on my laptop)
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ 1" # muted sound by default
        "waybar" # start status bar/system tray
        "nm-applet --indicator"
      ];

      monitor = [
        "eDP-1, 1920x1200, 0x0, 1"
        # (this turned out to be too annoying to work with as too many apps I use don't support scaling) place my desktop monitor above my laptop, and center it (((1920 / 0.75) - 1920) / 2 = 320, 1080 / 0.75 = 1440)
        # place my desktop monitor above my laptop
        "desc:Acer Technologies ED273 A 0x01010101, 1920x1080@120, 0x-1080, 1"
      ];

      input = {
        follow_mouse = "1";
        sensitivity = "0";
        kb_layout = "us";
        touchpad = {
          natural_scroll = "no";
        };
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

      plugin = {
        hyprbars = {
          bar_height = "30";
          bar_color = "rgb(272e33)";
          "col.text" = "rgb(d3c6aa)";
          bar_text_size = "12";
          bar_text_font = "Input Mono";
          bar_precedence_over_border = "true";
          bar_text_align = "center";
          bar_padding = "10";
          bar_button_padding = "9";
          hyprbars-button = [
            "rgb(e67e80), 13, , hyprctl dispatch killactive"
            "rgb(dbbc7f), 13, , hyprctl dispatch togglefloating"
            "rgb(a7c080), 13, , hyprctl dispatch fullscreen"
          ];
        };
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
      misc.disable_hyprland_logo = "true";

      windowrule = [
        # ^(code)$ selects VSCode windows
        # set opacity (active, inactive) for windows
        "opacity 0.95 0.85,^(code)$"
        "opacity 0.95 0.85,^(dev.zed.Zed)$"

        # disable bar for windows with native titlebars, use 'hyprctl clients' to get the window class
        "plugin:hyprbars:nobar,^(code)$"
        "plugin:hyprbars:nobar,^(dev.zed.Zed)$"
        "plugin:hyprbars:nobar,^(GitHub Desktop)$"
        "plugin:hyprbars:nobar,^(steam)$"
        #"plugin:hyprbars:nobar,^(vesktop)$"
      ];

      windowrulev2 = [
        # prevent screen locking when in fullscreen (e.g. watching a yt video)
        "idleinhibit fullscreen, class:^(*)$"
        "idleinhibit fullscreen, title:^(*)$"
        "idleinhibit fullscreen, fullscreen:1"

        # disable bar for windows with native titlebars, spotify for some reason has no window class
        #"plugin:hyprbars:nobar,initialTitle:(Spotify Premium)"
      ];
    };
  };
}
