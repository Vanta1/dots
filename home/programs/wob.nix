{pkgs, ...}: {
  # TODO: Make use of this
  home.packages = [pkgs.wob];
  xdg.configFile."wob/wob.ini".text = ''
    timeout = 666
    bar_color = d3c6aa
    background_color = 272e33
    border_color = 272e33
  '';
}
