{inputs, ...}: {
  imports = [
    inputs.sherlock.homeManagerModules.default
  ];

  programs.sherlock = {
    enable = true;
    settings = {
      aliases = {
        vesktop = {
          name = "Discord";
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
