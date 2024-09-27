{...}: {
  programs.kitty = {
    enable = true;
    theme = "Everforest Dark Hard";
    settings = {
      window_padding_width = 20;
      font_family = "Fira Code";
      font_size = 14;
      background_opacity = "0.85";
      allow_remote_control = "yes";
      dynamic_background_opacity = "yes";
      shell_integration = "enabled";
      confirm_os_window_close = -1;
      enable_audio_bell = "no";
    };
  };
}
