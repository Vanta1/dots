{personal, ...}: {
  programs.zathura = {
    enable = true;
    options = {
      font = "Monaspace Xenon 9";
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

  # Obsidian freezes when opening files w/ Zathura, and waits for the it to exit until it unfreezes. Disowning the process solves this.
  xdg.desktopEntries.zathura-detached = {
    type = "Application";
    name = "Zathura Detached";
    exec = "/home/${personal.user}/bin/Vanta1/detach-zathura.sh %U";
    terminal = false;
  };

  # TODO: not working, messing with obsidian workflow
  #xdg.mimeApps = {
  #  enable = true;
  #  defaultApplications = {
  #    "application/pdf" = "zathura-detached.desktop";
  #  };
  #};
}
