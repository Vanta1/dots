{...}: {
  programs.zathura = {
    enable = true;
    mappings = {
      "=" = "zoom in";
    };
    options = {
      font = "Monaspace Xenon 12";
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
      highlight-color = "rgba(75, 86, 92, 0.5)";
      highlight-active-color = "rgba(230, 126, 128, 0.5)";
      completion-bg = "#272e33";
      completion-fg = "#d3c6aa";
      completion-highlight-fg = "#4b565c";
      completion-highlight-bg = "#272e33";
      recolor-lightcolor = "#272e33";
      recolor-darkcolor = "#d3c6aa";
      recolor = "true"; # toggle this with Ctrl+R
      recolor-keephue = "false";
      selection-clipboard = "clipboard"; # use Ctrl+C and Ctrl+V for copy & paste
    };
  };

  # Obsidian freezes when opening files w/ Zathura, and waits for the it to exit until it unfreezes. Disowning the process solves this.
  xdg.desktopEntries.zathura-detached = {
    type = "Application";
    name = "Zathura Detached";
    exec = "detach-zathura.sh %U";
    mimeType = ["application/pdf"];
    terminal = false;
  };
}
