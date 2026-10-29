{ pkgs, ... }: {
  home.packages = [ pkgs.sunsetr ];

  systemd.user.services.sunsetr = {
    Unit = {
      Description = "start sunsetr";
      PartOf = "graphical-session.target";
      After = "graphical-session.target";
      Requisite = "graphical-session.target";
    };
    Install = {
      WantedBy = [ "niri.service" ];
    };
    Service = {
      ExecStart = "${pkgs.sunsetr}/bin/sunsetr";
    };
  };

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
