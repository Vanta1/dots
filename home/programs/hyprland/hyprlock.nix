{personal, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };
      background = {
        monitor = ""; # leave empty for all monitors
        path = "/home/${personal.user}/wallpapers/pxl_everforest_blender.png";
        blur_passes = 3;
        blur_size = 5;
        contrast = 0.95;
      };
      input-field = {
        monitor = "eDP-1"; # dont want this being doubled on my bigger monitor
        size = "360, 20";
        position = "0, -10";
        halign = "center";
        valign = "center";
        outline_thickness = 0;
        dots_size = 0.5;
        dots_spacing = 0.4;
        dots_center = true;
        dots_rounding = -2;
        placeholder_text = "";
        fail_text = "";
        font_color = "rgba(d3c6aaaa)";
        # keep everything except the text blank
        outer_color = "rgba(00000000)";
        inner_color = "rgba(00000000)";
        check_color = "rgba(00000000)";
        fail_color = "rgba(00000000)";
        fail_timeout = 100;
      };
    };
  };
}
