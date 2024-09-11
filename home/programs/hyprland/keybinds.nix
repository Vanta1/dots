{ personal, ... }: {
	wayland.windowManager.hyprland.settings = {
		"$mod" = "SUPER";
		"$resizeStep" = 10;

		# mouse binds for $mod + mouse left / mouse right = drag window / resize window
		bindm = [
			"$mod, mouse:272, movewindow"
			# TODO: this is giving me an error, should prob open an issue on github
			#"$mod, mouse:273, resizewindow" 
		];

		# my keybinds
		# 'bind' + 'e' = hold to repeat, 'l' = available on lockscreen

		# media keybinds, don't use mod keys 
		bindel = [
			# brightnesctl: -e flag means exponential curve, rather than linear when adjusting brightness. works better for me
			", XF86MonBrightnessUp, exec, brightnessctl -e --min-value=1 set 5%+" 
			", XF86MonBrightnessDown, exec, brightnessctl -e --min-value=1 set 5%-" 
			# volume controls
			", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
			", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"  
		];

		bindl = [
			# mute sound
			", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
			# mic controls, need to testtt
			", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
			# play/pause music
			", XF86AudioPlay, exec, playerctl play-pause"
		];
		
		bind = [
			# programs
			"$mod, RETURN, exec, alacritty" # terminal emulator
			"$mod, B, exec, firefox" # b for browser
			"$mod, W, exec, waypaper" # wallpaper setter
			"$mod SHIFT, W, exec, waypaper --random" # random wallpaper
			"$mod SHIFT, P, exec, manage_airpods.sh" # toggles connection w/ my airpods
			"$mod, O, exec, pkill tofi-drun || tofi-drun --drun-launch=true" # application launcher, o for open, close with $mod+O or ESC
			"$mod SHIFT, R, exec, pkill waybar ; waybar &!" # refresh waybar
			"$mod SHIFT, S, exec, grim -g \"$(slurp)\" \"/home/${personal.user}/screenshots/$(date +'%s_grim.png')\"" # screenshot
			"$mod SHIFT, BACKSPACE, exec, loginctl lock-session" # lock the screen
			#"$mod, T, exec, thunderbird" # email + calendar + todo list
			"$mod, D, exec, dunstctl close-all" # dismiss all notifications
			"$mod, COMMA, exec, playerctl --player=spotify previous" # seek/track w/ '<' / '>' 
			"$mod, PERIOD, exec, playerctl --player=spotify next"
			"$mod SHIFT, C, exec, code /etc/nixos" # edit this flake in vscode

			# window management keybinds

			# misc important
			"$mod CTRL, Q, exit," # exit Hyprland
			"$mod, Q, killactive," # kill current window
			"$mod, F, fullscreen, 0" # regular fullscreen
			"$mod, M, fullscreen, 1" # 'monocle'/maximize - doesn't remove titlebar or bars

			# workspace navigation w/ workspace numbers. I like having numbered workspaces, but I'd like to try having dynamic labeled workspaces
			"$mod, 1, workspace, 1"
			"$mod, 2, workspace, 2"
			"$mod, 3, workspace, 3"
			"$mod, 4, workspace, 4"
			"$mod, 5, workspace, 5"
			"$mod, 6, workspace, 6"
			"$mod, 7, workspace, 7"
			"$mod, 8, workspace, 8"

			# move window and set current workspace w/ shift + workspace number
			"$mod SHIFT, 1, movetoworkspace, 1"
			"$mod SHIFT, 2, movetoworkspace, 2"
			"$mod SHIFT, 3, movetoworkspace, 3"
			"$mod SHIFT, 4, movetoworkspace, 4"
			"$mod SHIFT, 5, movetoworkspace, 5"
			"$mod SHIFT, 6, movetoworkspace, 6"
			"$mod SHIFT, 7, movetoworkspace, 7"
			"$mod SHIFT, 8, movetoworkspace, 8"

			# send a window to a workspace w/ control + workspace number
			"$mod CTRL, 1, movetoworkspacesilent, 1"
			"$mod CTRL, 2, movetoworkspacesilent, 2"
			"$mod CTRL, 3, movetoworkspacesilent, 3"
			"$mod CTRL, 4, movetoworkspacesilent, 4"
			"$mod CTRL, 5, movetoworkspacesilent, 5"
			"$mod CTRL, 6, movetoworkspacesilent, 6"
			"$mod CTRL, 7, movetoworkspacesilent, 7"
			"$mod CTRL, 8, movetoworkspacesilent, 8"
		];

		binde = [
			# window navigation w/ vim keys (HJKL : ←↓↑→)
			"$mod, H, movefocus, l"
			"$mod, J, movefocus, d"
			"$mod, K, movefocus, u"
			"$mod, L, movefocus, r"

			# moving windows w/ shift + vim keys
			"$mod SHIFT, H, movewindow, l"
			"$mod SHIFT, J, movewindow, d"
			"$mod SHIFT, K, movewindow, u"
			"$mod SHIFT, L, movewindow, r"

			# resizing windows w/ control + vim keys
			"$mod CTRL, H, resizeactive, -$resizeStep 0"
			"$mod CTRL, J, resizeactive, 0 $resizeStep"
			"$mod CTRL, K, resizeactive, 0 -$resizeStep"
			"$mod CTRL, L, resizeactive, $resizeStep 0"

			# Uncomment for arrow key navigation + resizing in addition to vim keys
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
		];
	};
}
