{ personal, ... }: {
	programs.firefox = {
		enable = true;
		profiles.${personal.user} = {
			settings = {
				"layout.css.devPixelsPerPx" = "1.3"; # rescale the ui to be a little larger, feels better on a small laptop
				"browser.tabs.closeWindowWithLastTab" = false; # i like to spam Ctrl+W to close all my tabs   
				"toolkit.legacyUserProfileCustomizations.stylesheets" = true; # enable userChrome.css
			};
			userChrome = builtins.readFile ./userChrome.css; # custom css styles
		};
	};
}
