{ config, pkgs, ... }: {
  programs.zathura = {
    enable = true;
    # TODO: update this zathura.settings format
    extraConfig = ''
set default-bg                  "#4b565c"
set default-fg                  "#d3c6aa"

set statusbar-fg                "#d3c6aa"
set statusbar-bg                "#2b3339"

set inputbar-bg                 "#2b3339"
set inputbar-fg                 "#d3c6aa"

set notification-bg             "#2b3339"
set notification-fg             "#d3c6aa"

set notification-error-bg       "#2b3339"
set notification-error-fg       "#d3c6aa"

set notification-warning-bg     "#2b3339"
set notification-warning-fg     "#d3c6aa"

set highlight-color             "#4b565c"
set highlight-active-color      "#e67e80"

set completion-bg               "#2b3339"
set completion-fg               "#d3c6aa"

set completion-highlight-fg     "#4b565c"
set completion-highlight-bg     "#2b3339"

set recolor-lightcolor          "#2b3339"
set recolor-darkcolor           "#d3c6aa"

set recolor                     "true"
set recolor-keephue             "false"
    '';
  };

  xdg.desktopEntries.zathura = {
    name = "Zathura";
    exec = "zathura";
    terminal = false;
  };
}
