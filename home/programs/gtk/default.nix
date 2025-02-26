{
  pkgs,
  personal,
  ...
}: {
  home.packages = with pkgs; [
    dconf # home-manager.service fails when it can't find 'ca.desrt.dconf', https://github.com/nix-community/home-manager/issues/3113
    gnome-tweaks
    gtk-engine-murrine # for everforest theme
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Everforest-Dark-BL";
      package = pkgs.everforest-gtk-theme;
    };
    iconTheme = {
      name = "Vimix";
      package = pkgs.vimix-icon-theme;
    };
    cursorTheme = {
      name = "Simp1e-Dark";
      package = pkgs.simp1e-cursors;
      size = personal.cursor-size;
    };
  };
}
