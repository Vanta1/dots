{ ... }: {
  xdg.configFile."sunsetr/sunsetr.toml".text = ''
    backend = "auto"
    transition_mode = "static"
    smoothing = false
    static_temp = 6500
    static_gamma = 100
  '';

  xdg.configFile."sunsetr/presets/night/sunsetr.toml".text = ''
    transition_mode = "static"
    smoothing = false
    static_temp = 4500
    static_gamma = 100
  '';
}
