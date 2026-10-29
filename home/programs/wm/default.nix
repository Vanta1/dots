{
  pkgs,
  personal,
  ...
}:
{
  imports = [
    ./niri.nix

    # stuff in my setup
    ./sunsetr.nix # blue light filter
    ./swaylock.nix # lock screen
    ./waybar.nix # status bar
  ];

  home.packages = [
    # in niri's [important software](https://niri-wm.github.io/niri/Important-Software.html)
    pkgs.xwayland-satellite

    pkgs.swaybg # wallpaper setter
  ];

  systemd.user.services = {
    # from the [niri wiki](https://niri-wm.github.io/niri/Example-systemd-Setup.html)
    swaybg = {
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
  };
}
