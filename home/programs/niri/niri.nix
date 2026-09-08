{ personal, ... }: {
  xdg.configFile."niri/config.kdl".text =
    let
      script-dir = "/home/${personal.user}/bin/vanta1";
    in
    ''
      environment {
        XDG_CURRENT_DESKTOP                     "niri"
        XDG_SESSION_TYPE                        "wayland"
        XDG_SESSION_DESKTOP                     "niri"
        XCURSOR_SIZE                            "${builtins.toString personal.cursor-size}"
        QT_QPA_PLATFORM                         "wayland"
        QT_QPA_PLATFORMTHEME                    "qt5ct"
        QT_AUTO_SCREEN_SCALE_FACTOR             "1"
        QT_WAYLAND_DISABLE_WINDOWDECORATION     "1"
        NIXOS_OZONE_WL                          "1"
        ELECTRON_OZONE_PLATFORM_HINT            "auto"
      }

      input {
        touchpad {
          tap
        }

        focus-follows-mouse max-scroll-amount="0%"
      }

      // hot corners are just kinda annoying most of the times
      gestures {
        hot-corners {
          off
        }
      }

      cursor {
        xcursor-theme "Simp1e-Dark"
        xcursor-size ${builtins.toString personal.cursor-size}
      }

      output "eDP-1" {
        mode "1920x1200@59.950"
        scale 1
        transform "normal"
        position x=0 y=0
      }

      output "DP-3" {
        mode "1920x1080@119.882"
        scale 0.80
        transform "normal"
        position x=0 y=-1350
      }

      output "DP-1" {
        mode "1920x1080@60"
        scale 1
        transform "normal"
        position x=0 y=-1200
      }

      layout {
        background-color "transparent"

        gaps 12
        center-focused-column "never"
        preset-column-widths {
          proportion 0.4
          proportion 0.6
        }

        default-column-width { proportion 0.5; }

        focus-ring {
          off
        }

        border {
          width 4
          active-color "#374145"
          inactive-color "#272e33"
          urgent-color "#4c3743"
        }

        tab-indicator {
          width 4
          length total-proportion=0.96
          gap -4
          gaps-between-tabs 0
          corner-radius 12
          active-color "#859289"
          inactive-color "#374145"
          urgent-color "#4c3743"
        }
      }

      overview {
        zoom 0.64

        workspace-shadow { off; }
      }

      recent-windows {
        previews {
          max-height 1000
          max-scale 0.5
        }

        highlight {
          active-color "#374145ee"
          urgent-color "#4c3743ee"
          padding 12
          corner-radius 12
        }
      }

      hotkey-overlay {
        skip-at-startup
      }

      prefer-no-csd

      screenshot-path "~/screenshots/%Y-%m-%d %H-%M-%S.png"

      window-rule {
        open-maximized true
        geometry-corner-radius 12
        clip-to-geometry true
      }

      window-rule {
        match app-id="Alacritty"
        open-maximized false
        default-column-width { proportion 0.5; }
      }

      window-rule {
        match app-id="Alacritty" is-active=true
        match app-id="dev.zed.Zed" is-active=true
        match app-id="obsidian" is-active=true
        match app-id="org.pwmt.zathura" is-active=true

        opacity 0.95
      }

      window-rule {
        match app-id="Alacritty" is-active=false
        match app-id="dev.zed.Zed" is-active=false
        match app-id="obsidian" is-active=false
        match app-id="org.pwmt.zathura" is-active=false

        opacity 0.85
      }

      window-rule {
        match app-id="firefox"
        match app-id="dev.zed.Zed"
        match app-id="darktable"

        open-maximized-to-edges true
      }

      window-rule {
        match app-id="firefox" title="^Picture-in-Picture$"
        match app-id="dev.zed.Zed" title="^Settings$"

        open-floating true
      }

      layer-rule {
        match namespace="^wallpaper$"
        place-within-backdrop true
      }

      binds {
        Mod+Shift+Slash { show-hotkey-overlay; }

        Mod+Return    hotkey-overlay-title="Open a Terminal: alacritty" { spawn "alacritty"; }
        Mod+O         hotkey-overlay-title="Run an Application: tofi"   { spawn-sh "pkill tofi-drun || tofi-drun --drun-launch=true"; }
        Mod+B         hotkey-overlay-title="Open Browser: Firefox"      { spawn "firefox"; }
        Mod+N         hotkey-overlay-title="Open File Explorer: Nemo"   { spawn "nemo"; }
        Mod+G         hotkey-overlay-title="Open Steam"                 { spawn "steam"; }
        Mod+Shift+N   hotkey-overlay-title="Open Obsidian"              { spawn "obsidian"; }
        Mod+D         hotkey-overlay-title="Show Old Notifications"     { spawn "dunstctl" "history-pop"; }
        Mod+Shift+D   hotkey-overlay-title="Dismiss All Notifications"  { spawn "dunstctl" "close-all"; }
        Mod+Comma     hotkey-overlay-title="playerctl: seek"            { spawn "playerctl" "previous"; }
        Mod+Period    hotkey-overlay-title="playerctl: track"           { spawn "playerctl" "next"; }
        Mod+Space     hotkey-overlay-title="playerctl: pause"           { spawn "playerctl" "play-pause"; }
        Mod+Shift+R   hotkey-overlay-title="restart waybar"             { spawn "systemctl" "--user" "restart" "niri-waybar.service"; }

        Mod+Shift+P   hotkey-overlay-title=null                         { spawn "${script-dir}/manage_airpods.sh"; }
        Mod+Ctrl+B    hotkey-overlay-title=null allow-when-locked=true  { spawn "${script-dir}/sync_brightness.sh"; }

        // Audio
        XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+"; }
        XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"; }
        XF86AudioMute        allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
        XF86AudioMicMute     allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }

        // Brightness & Colour Temperature
        XF86MonBrightnessUp              allow-when-locked=true  { spawn "brightnessctl" "-e" "--min-value=1" "set" "5%+"; }
        XF86MonBrightnessDown            allow-when-locked=true  { spawn "brightnessctl" "-e" "--min-value=1" "set" "5%-"; }
        Ctrl+XF86MonBrightnessDown       allow-when-locked=true  { spawn-sh "sunsetr p night"; }

        Mod+Ctrl+Q { close-window; }

        //Navigation
        Mod+Left  { focus-column-left; }
        Mod+Down  { focus-window-down; }
        Mod+Up    { focus-window-up; }
        Mod+Right { focus-column-right; }
        Mod+H     { focus-column-left; }
        Mod+J     { focus-window-down; }
        Mod+K     { focus-window-up; }
        Mod+L     { focus-column-right; }

        Mod+Home { focus-column-first; }
        Mod+End  { focus-column-last; }

        Mod+U              { focus-workspace-down; }
        Mod+I              { focus-workspace-up; }

        // Moving Windows
        Mod+Shift+Left  { move-column-left; }
        Mod+Shift+Down  { move-window-down; }
        Mod+Shift+Up    { move-window-up; }
        Mod+Shift+Right { move-column-right; }
        Mod+Shift+H     { move-column-left; }
        Mod+Shift+J     { move-window-down; }
        Mod+Shift+K     { move-window-up; }
        Mod+Shift+L     { move-column-right; }

        Mod+Ctrl+Home { move-column-to-first; }
        Mod+Ctrl+End  { move-column-to-last; }

        Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
        Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }

        Mod+Ctrl+U         { move-column-to-workspace-down; }
        Mod+Ctrl+I         { move-column-to-workspace-up; }

        Mod+Shift+U         { move-workspace-down; }
        Mod+Shift+I         { move-workspace-up; }

        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }

        Mod+Shift+1 { move-column-to-workspace 1; }
        Mod+Shift+2 { move-column-to-workspace 2; }
        Mod+Shift+3 { move-column-to-workspace 3; }
        Mod+Shift+4 { move-column-to-workspace 4; }
        Mod+Shift+5 { move-column-to-workspace 5; }
        Mod+Shift+6 { move-column-to-workspace 6; }
        Mod+Shift+7 { move-column-to-workspace 7; }
        Mod+Shift+8 { move-column-to-workspace 8; }
        Mod+Shift+9 { move-column-to-workspace 9; }

        // The following binds move the focused window in and out of a column.
        Mod+BracketLeft  { consume-or-expel-window-left; }
        Mod+BracketRight { consume-or-expel-window-right; }

        // toggle between full-width and half-width
        Mod+M { maximize-column; }

        // Expand the focused column to space not taken up by other fully visible columns.
        // Makes the column "fill the rest of the space".
        Mod+Ctrl+F { expand-column-to-available-width; }

        Mod+F       { maximize-window-to-edges; } // leaves bar
        Mod+Shift+F { fullscreen-window; } // complete fullscreen

        Mod+C { center-column; }

        // screen mirroring
        Mod+P repeat=false { spawn-sh "wl-mirror $(niri msg --json focused-output | jq -r .name)"; }

        // Center all fully visible columns on screen.
        Mod+Ctrl+C { center-visible-columns; }
        Mod+Ctrl+H { set-column-width "-5%"; }
        Mod+Ctrl+J { set-window-height "+5%"; }
        Mod+Ctrl+K { set-window-height "-5%"; }
        Mod+Ctrl+L { set-column-width "+5%"; }

        Mod+V       { toggle-window-floating; }
        Mod+Shift+V { switch-focus-between-floating-and-tiling; }

        Mod+W { toggle-column-tabbed-display; }

        Mod+Shift+E { quit; }

        Mod+Shift+Backspace { power-off-monitors; }
      }
    '';
}
