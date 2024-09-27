{...}: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          # 1.5 min, dim screen
          timeout = 90;
          on-timeout = "brightnessctl -s set 8";
          on-resume = "brightnessctl -r";
        }
        {
          # 2.5 min, lock screen
          timeout = 150;
          on-timeout = "loginctl lock-session";
        }
        {
          # 5 min, turn monitor off
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          # 10 min, eepy time
          timeout = 600;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
