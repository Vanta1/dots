{ config, pkgs, user, ... }: {
  programs.firefox = {
    enable = true;

    profiles.${user} = {
      settings = {
        "layout.css.devPixelsPerPx" = "1.3";
        "browser.tabs.closeWindowWithLastTab" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # enable userChrome.css
      };
      userChrome = builtins.readFile ./userChrome.css;
    };
    
  };
}
