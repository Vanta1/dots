{ inputs, config, pkgs, ... }: {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$resizeStep" = 10;

    # media keybinds (e = hold to repeat, l = available on lockscreen)
    bindel = [
      ", XF86MonBrightnessUp, exec, brightnessctl -e --min-value=1 set 5%+" 
      ", XF86MonBrightnessDown, exec, brightnessctl -e --min-value=1 set 5%-" 
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%-"  
    ];

    bindl = [
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ];

    bind = [
      # programs
      "$mod, RETURN, exec, kitty" # terminal emulator
      "$mod, B, exec, firefox" # b for browser
      "$mod, W, exec, waypaper" # wallpaper setter
      "$mod SHIFT, P, exec, manage_airpods.sh" # toggles my airpods TODO: move to some custom just-for-me file, so this is redistributable
      "$mod, O, exec, pkill tofi-drun || tofi-drun --drun-launch=true" # launcher
      "$mod SHIFT, C, exec, code"

      # misc important
      "$mod CTRL, Q, exit,"
      "$mod, Q, killactive,"
      "$mod, F, fullscreen, 0" # regular fullscreen
      "$mod, M, fullscreen, 1" # 'monocle'/maximize - doesn't remove titlebar or bars

      # window navigation
      "$mod, H, movefocus, l"
      "$mod, J, movefocus, d"
      "$mod, K, movefocus, u"
      "$mod, L, movefocus, r"

      # moving windows
      "$mod SHIFT, H, movewindow, l"
      "$mod SHIFT, J, movewindow, d"
      "$mod SHIFT, K, movewindow, u"
      "$mod SHIFT, L, movewindow, r"

      # resizing windows
      "$mod CTRL, H, resizeactive, -$resizeStep 0"
      "$mod CTRL, J, resizeactive, 0 $resizeStep"
      "$mod CTRL, K, resizeactive, 0 -$resizeStep"
      "$mod CTRL, L, resizeactive, $resizeStep 0"

      ## Uncomment for arrow key navigation + resizing in addition to vim keys (HJKL : ←↓↑→)
      #"$mod, left, movefocus, l"
      #"$mod, down, movefocus, d"
      #"$mod, up, movefocus, u"
      #"$mod, right, movefocus, r"
      #"$mod SHIFT, left, movewindow, l"
      #"$mod SHIFT, down, movewindow, d"
      #"$mod SHIFT, up, movewindow, u"
      #"$mod SHIFT, right, movewindow, r"
      #"$mod CTRL, H, resizeactive, -$resizeStep 0"
      #"$mod CTRL, J, resizeactive, 0 $resizeStep"
      #"$mod CTRL, K, resizeactive, 0 -$resizeStep"
      #"$mod CTRL, L, resizeactive, $resizeStep 0"

      # workspace navigation
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      # send a window to a workspace
      "$mod SHIFT, 1, movetoworkspacesilent, 1"
      "$mod SHIFT, 2, movetoworkspacesilent, 2"
      "$mod SHIFT, 3, movetoworkspacesilent, 3"
      "$mod SHIFT, 4, movetoworkspacesilent, 4"
      "$mod SHIFT, 5, movetoworkspacesilent, 5"
      "$mod SHIFT, 6, movetoworkspacesilent, 6"
      "$mod SHIFT, 7, movetoworkspacesilent, 7"
      "$mod SHIFT, 8, movetoworkspacesilent, 8"
      "$mod SHIFT, 9, movetoworkspacesilent, 9"
      "$mod SHIFT, 0, movetoworkspacesilent, 10"

      # move window and focus
      "$mod CTRL, 1, movetoworkspace, 1"
      "$mod CTRL, 2, movetoworkspace, 2"
      "$mod CTRL, 3, movetoworkspace, 3"
      "$mod CTRL, 4, movetoworkspace, 4"
      "$mod CTRL, 5, movetoworkspace, 5"
      "$mod CTRL, 6, movetoworkspace, 6"
      "$mod CTRL, 7, movetoworkspace, 7"
      "$mod CTRL, 8, movetoworkspace, 8"
      "$mod CTRL, 9, movetoworkspace, 9"
      "$mod CTRL, 0, movetoworkspace, 10"
    ];
  };
}
