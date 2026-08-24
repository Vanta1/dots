{pkgs, ...}: {
  services.dunst.enable = true;
  # TODO: translate this to nix syntax w/ services.dunst.settings
  xdg.configFile."dunst/dunstrc".text = ''
    [colors]
    background = "#272e33"
    foreground = "#d3c6aa"

    [global]
    monitor = 1
    width = 400
    height = 300

    padding = 12
    text_icon_padding = 12
    horizontal_padding = 12

    frame_width = 3
    frame_color = "#2e383c"

    origin = bottom-right
    offset = 12x12

    gap_size = 12

    corner_radius = 12
    icon_corner_radius = 9

    icon_theme = "Vimix"
    icon_position = left
    min_icon_size = 96
    max_icon_size = 96

    font = Monaspace Xenon 12
    line_height = 2
    format = "<b>%a</b>\n%s\n%b"
    browser = ${pkgs.firefox}/bin/firefox
  '';
}
