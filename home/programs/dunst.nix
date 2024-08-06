{ config, pkgs, ... }: {
	services.dunst.enable = true; 
	# TODO: translate this to nix syntax w/ services.dunst.settings
	xdg.configFile."dunst/dunstrc" = {
		text = ''
			[colors]
				background = "#232e33"
				frame = "#374145"
				foreground = "#d3c6aa"

			[global]
				width = 500
				height = 300
				padding = 12
				horizontal_padding = 12
				frame_width = 4
				corner_radius = 12
				origin = bottom-right
				offset = 12x12
				gap_size = 12
				min_icon_size = 250
				font = Input Sans 12
				format = "<b>%a</b>\n%s\n%b
				browser = ${pkgs.firefox}/bin/firefox
		'';
	};
}