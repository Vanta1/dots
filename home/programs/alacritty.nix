{ config, pkgs, ... }: {
	programs.alacritty = {
		enable = true;
		settings = {
			window = {
				padding = { 
					x = 20;
					y = 20;
				};
				opacity = 0.85;
			};
			font = {
				normal = {
					family = "Input Mono";
				};
				size = 14;
			};
			colors.primary = {
				background = "#272e33";
				foreground = "#d3c6aa";
			};
			colors.normal = {
				black   = "#414b50";
				red     = "#e67e80";
				green   = "#a7c080";
				yellow  = "#dbbc7f";
				blue    = "#7fbbb3";
				magenta = "#d699b6";
				cyan    = "#83c092";
				white   = "#d3c6aa";
			};
			colors.bright = {
				black   = "#475258";
				red     = "#e67e80";
				green   = "#a7c080";
				yellow  = "#dbbc7f";
				blue    = "#7fbbb3";
				magenta = "#d699b6";
				cyan    = "#83c092";
				white   = "#d3c6aa";
			};
		};
	};
}