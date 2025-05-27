{
  inputs,
  pkgs,
  personal,
  ...
}: {
  imports = [
    ./keybinds.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];

  home.packages = with pkgs; [
    waypaper
    swaybg # backend for waypaper
    #xdg-desktop-portal-hyprland # allows for screen sharing
    #xdg-desktop-portal-gtk
    #hypridle
    hyprlock
    nwg-look # for setting cursor theme
    inputs.hyprsunset.packages.${system}.hyprsunset
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [pkgs.hyprlandPlugins.hyprbars];

    settings = let
      font-family = "Monaspace Xenon";
    in {
      # environment variables
      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE, ${builtins.toString personal.cursor-size}"
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "NIXOS_OZONE_WL,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
      ];

      # programs run once on startup
      exec-once = [
        "hyprctl setcursor 'Simp1e-Dark' ${builtins.toString personal.cursor-size}"
        "waypaper --restore" # restore previous wallpaper
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
          natural_scroll = false;
        };
      };

      cursor = {
        enable_hyprcursor = "true";
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

      group = {
        "col.border_active" = "rgb(374145)";
        "col.border_inactive" = "rgb(272e33)";
        groupbar = {
          font_family = "${font-family}";
          height = "30";
          font_size = "12";
          "col.active" = "rgb(9da9a0)";
          "col.inactive" = "rgb(7a8478)";
        };
      };

      plugin = {
        hyprbars = {
          bar_height = "30";
          bar_color = "rgb(272e33)";
          "col.text" = "rgb(d3c6aa)";
          bar_text_size = "12";
          bar_text_font = "${font-family}";
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

      decoration = {
        rounding = "12";
        blur = {
          enabled = "false";
        };
        "shadow:enabled" = "false";
      };

      gestures = {
        workspace_swipe = "true";
        workspace_swipe_invert = "false";
      };

      animations.enabled = "no";
      dwindle.preserve_split = "yes";
      misc = {
        font_family = "${font-family}";
        disable_hyprland_logo = "true";
      };

      windowrule = [
        # ^(code)$ selects VSCode windows
        # set opacity (active, inactive) for windows
        "opacity 0.95 0.85,class:^(code)$"
        "opacity 0.95 0.85,class:^(dev.zed.Zed)$"
        "opacity 0.95 0.85,class:^(obsidian)$"
        "opacity 0.95 0.85,class:^(org.pwmt.zathura)$"
        "opacity 0.95 0.85,class:^(waybar)$"

        # disable bar, just my preference for these apps, use 'hyprctl clients' to get the window class
        "plugin:hyprbars:nobar,class:^(code)$" # VSCode, has built in titlebar that's more fully featured.
        "plugin:hyprbars:nobar,class:^(dev.zed.Zed)$" # Zed IDE
        "plugin:hyprbars:nobar,class:^(GitHub Desktop)$"
        "plugin:hyprbars:nobar,class:^(steam)$" # Has native titlebar I can't toggle off.
        "plugin:hyprbars:nobar,class:^(obsidian)$" # Again, has a native titlebar.
        "plugin:hyprbars:nobar,class:^(org.pwmt.zathura)$" # Shows the document you're in at the bottom, making title redundant.
        #"plugin:hyprbars:nobar,^(vesktop)$"

        # prevent screen locking when in fullscreen (e.g. watching a yt video)
        "idleinhibit fullscreen, class:^(*)$"
        "idleinhibit fullscreen, title:^(*)$"
        "idleinhibit fullscreen, fullscreen:1"

        # disable bar for windows with native titlebars, spotify for some reason has no window class
        #"plugin:hyprbars:nobar,initialTitle:(Spotify Premium)""

        # replicate "no_gaps_when_only"
        "bordersize 0, floating:0, onworkspace:w[tv1]"
        "rounding 0, floating:0, onworkspace:w[tv1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 0, floating:0, onworkspace:f[1]"
      ];

      workspace = [
        # replicate "no_gaps_when_only" functionality
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];
    };
  };
}
