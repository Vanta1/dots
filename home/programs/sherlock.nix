{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.sherlock.homeManagerModules.default
  ];

  programs.sherlock = {
    enable = true;
    package = inputs.sherlock.packages.${pkgs.system}.default;
    settings = {
      aliases = {
        vesktop = {
          name = "Discord";
        };
      };
      config = {
        debug = {
          try_suppress_warnings = true;
        };
      };
      ignore = ''
        Avahi*
      '';
      launchers = [
        {
          name = "App Launcher";
          type = "app_launcher";
          args = {};
          priority = 1;
          home = true;
        }
      ];
    };
  };
}
