{ config, pkgs, ... }: {
  programs.zathura = {
    enable = true;
    # TODO: update this to zathura.settings format
    extraConfig = ''
      set default-bg                  "#272e33"
      set default-fg                  "#d3c6aa"

      set statusbar-fg                "#d3c6aa"
      set statusbar-bg                "#272e33"

      set inputbar-bg                 "#272e33"
      set inputbar-fg                 "#d3c6aa"

      set notification-bg             "#272e33"
      set notification-fg             "#d3c6aa"

      set notification-error-bg       "#272e33"
      set notification-error-fg       "#d3c6aa"

      set notification-warning-bg     "#272e33"
      set notification-warning-fg     "#d3c6aa"

      set highlight-color             "#4b565c"
      set highlight-active-color      "#e67e80"

      set completion-bg               "#272e33"
      set completion-fg               "#d3c6aa"

      set completion-highlight-fg     "#4b565c"
      set completion-highlight-bg     "#272e33"

      set recolor-lightcolor          "#272e33"
      set recolor-darkcolor           "#d3c6aa"

      set recolor                     "true"
      set recolor-keephue             "false"
    '';
  };

  # This turned out to be unnecessary, but I'm leaving it here for now as a good example of how to add custom .desktop files
  #xdg.desktopEntries.zathura = {
  #  name = "Zathura";
  #  exec = "zathura";
  #  terminal = false;
  #};
}
