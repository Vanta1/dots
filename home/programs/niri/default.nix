{
  pkgs,
  personal,
  ...
}:
{
  imports = [
    ./niri.nix
    ./sunsetr.nix
  ];

  home.packages = [
    # in niri's [important software](https://niri-wm.github.io/niri/Important-Software.html)
    pkgs.xwayland-satellite

    # stuff in my setup
    pkgs.swaybg # wallpaper setter
    pkgs.sunsetr # blue light filter
  ];

  systemd.user.services = {
    # from the [niri wiki](https://niri-wm.github.io/niri/Example-systemd-Setup.html)
    niri-swaybg = {
      Unit = {
        Description = "sets the wallpaper";
        PartOf = "graphical-session.target";
        After = "graphical-session.target";
        Requisite = "graphical-session.target";
      };
      Install = {
        WantedBy = [ "niri.service" ];
      };
      Service = {
        ExecStart = "${pkgs.swaybg}/bin/swaybg -m fill -i ${personal.wallpaper}";
      };
    };
    niri-waybar = {
      Unit = {
        Description = "start waybar";
        PartOf = "graphical-session.target";
        After = "graphical-session.target";
        Requisite = "graphical-session.target";
      };
      Install = {
        WantedBy = [ "niri.service" ];
      };
      Service = {
        ExecStart = "${pkgs.waybar}/bin/waybar";
      };
    };
    niri-sunsetr = {
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
  };
}
