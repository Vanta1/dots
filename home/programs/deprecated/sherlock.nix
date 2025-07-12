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
    package = pkgs.sherlock-launcher;
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
          name = "Clipboard";
          type = "clipboard-execution";
          args = {
            capabilities = [
              "url"
              "colors.all"
              "calc.units"
            ];
          };
          priority = 1;
          home = true;
        }
        {
          name = "App Launcher";
          type = "app_launcher";
          args = {};
          priority = 2;
          home = true;
        }
        {
          name = "Calculator";
          type = "calculation";
          args = {
            capabilities = [
              "calc.math"
              "calc.units"
            ];
          };
          alias = "=";
          priority = 3;
        }
      ];
      style = null;
    };
  };
}
