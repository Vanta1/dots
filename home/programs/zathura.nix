{...}: {
  programs.zathura = {
    enable = true;
    options = {
      default-bg = "#272e33";
      default-fg = "#d3c6aa";
      statusbar-fg = "#d3c6aa";
      statusbar-bg = "#272e33";
      inputbar-bg = "#272e33";
      inputbar-fg = "#d3c6aa";
      notification-bg = "#272e33";
      notification-fg = "#d3c6aa";
      notification-error-bg = "#272e33";
      notification-error-fg = "#d3c6aa";
      notification-warning-bg = "#272e33";
      notification-warning-fg = "#d3c6aa";
      highlight-color = "#4b565c";
      highlight-active-color = "#e67e80";
      completion-bg = "#272e33";
      completion-fg = "#d3c6aa";
      completion-highlight-fg = "#4b565c";
      completion-highlight-bg = "#272e33";
      recolor-lightcolor = "#272e33";
      recolor-darkcolor = "#d3c6aa";
      recolor = "true";
      recolor-keephue = "false";
    };
  };

  # This turned out to be unnecessary, but I'm leaving it here for now as a good example of how to add custom .desktop files
  #xdg.desktopEntries.zathura = {
  #  name = "Zathura";
  #  exec = "zathura";
  #  terminal = false;
  #};
}
