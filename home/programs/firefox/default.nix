{personal, ...}: {
  programs.firefox = {
    enable = true;
    profiles.${personal.user} = {
      settings = {
        "layout.css.devPixelsPerPx" = "1.3"; # rescale the ui to be a little larger, feels better on a small laptop
        "browser.tabs.closeWindowWithLastTab" = false; # i like to spam Ctrl+W to close all my tabs
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # enable userChrome.css

        # remove firefox logo from new tabs
        "browser.newtabpage.activity-stream.newtabLayouts.variant-a" = false;
        "browser.newtabpage.activity-stream.newtabLayouts.variant-b" = false;

        # enable tab groups
        "browser.tabs.group.enabled" = true;
      };

      # custom css styles
      userChrome = builtins.readFile ./userChrome.css;
      userContent = builtins.readFile ./userContent.css;
    };
  };
}
