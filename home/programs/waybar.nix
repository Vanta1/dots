{ config, pkgs, inputs, personal, ... }: {
	programs.waybar = {
		enable = true;
		package = inputs.waybar.packages.${pkgs.system}.waybar;
		settings = {
			bar = {
				position = "bottom";
				height = 30; # matches with hyprbar height, which feels satisfying with fullscreen windows imo
				output = "eDP-1";
				modules-left = [
					"hyprland/workspaces"
				];
				modules-center = [
					"clock#date"
					"custom/separator"
					"clock#time"
					# separator built in to spotify-pause;
					"custom/spotify-pause"
					"custom/spotify"
				];
				modules-right = [
					# TODO: figure out a way to make the tray separator go away when tray is empty
					"group/tray" 
					# TODO: figure out if this or some kind of manual solution involving workspaces would be better for minimizing windows,,,, i probably want to make my own cause that seems fun
					# "taskbar" "custom/separator", 
					"wireplumber" 
					"custom/separator"
					"network" 
					"custom/separator"
					"battery"
				];
				"custom/separator" = {
					format = "|";
					tooltip = false;
				};
				"hyprland/workspaces" = {
					"persistent-workspaces" = { 
						"*" = 8; 
					};
				};
				"clock#date" = {
					format = "{:%A, %B %d}";
					tooltip = true;
					tooltip-format = "{:%Y-%m-%d}";
				};
				"clock#time" = {
					format = "{:%I:%M %p}";
					tooltip = true;
					tooltip-format = "{:%H:%M:%S}";
				};
				"custom/spotify-pause" = {
					exec = "/home/${personal.user}/bin/vanta1/get_paused.sh";
					on-click = "playerctl --player=spotify play-pause";
					tooltip = false;
				};
				"custom/spotify" = {
					exec = "/home/${personal.user}/bin/vanta1/get_playing.sh";
					on-click = "playerctl --player=spotify play-pause";
					tooltip = false;
				};
				"group/tray" = {
					orientation = "horizontal";
					modules = [
						"tray"
						"custom/separator"
					];
				};
				tray = {
					spacing = 9;
					show-passive-icons = true;
				};
				wireplumber = {
					format = "VOL {volume}";
				};
				network = {
					format-wifi = "NET {essid}";
					format-disconnected = "NET disconnected";
					max-length = 50;
					tooltip = true;
					tooltip-format = "STR {signalStrength}";
				};
				battery = {
					interval = 60;
					states = {
						warning = 30;
						critical = 15;
						dead = 5;
					};
					format = "BAT {capacity}%";
				};
			};
		};
		style = ''
			/* required to set the bar height less than 34 */
			* { padding: 0; margin: 0; }

			/* correct text placement/baseline */
			.modules-left, .modules-center, .modules-right { margin-bottom: -3px; }

			/* pad modules from screen border */
			.modules-left  { margin-left:  0px; }
			.modules-right { margin-right: 7px; }  

			window#waybar {
				background-color: #272e33;
				color: #d3c6aa;
				font-family: Input Mono;
				font-size: 12pt;
			}

			#custom-separator { 
				margin-bottom: 3px; 
				padding-left: 6px;
				padding-right: 6px;
			}

			#custom-spotify-pause {
				margin-bottom: 3px; 
				padding-left: 6px;
				padding-right: 6px;
			}

			tooltip {
				background-color: #272e33;
				border: 1px solid #9da9a0;
			}

			tooltip label {
				color: #d3c6aa;
				font-family: Input Mono;
				font-size: 10pt;
			}

			#workspaces button {
				color: #d3c6aa;
				padding: 0 3px;
				border-radius: 0;
				background-color: #272e33;
			}

			#workspaces button.empty {
				color: #859289;
			}

			#workspaces button.visible {
				background-color: #2e383c;
			}

			#workspaces button.active {
				background-color: #374145;
				color: #d3c6aa;
			}

			#workspaces button:hover {
				background-color: #272e33;
			}

			#wireplumber {
				color: #a7c080;
			}

			#wireplumber.muted {
				color: #7a8478;
			}

			#network.wifi {
				color: #a7c080;
			}

			#network.disconnected {
				color: #e67e80;
			}

			#battery {
				color: #a7c080;
			}

			#battery.warning {
				color: #dbbc7f;
			}

			#battery.critical {
				color: #e67e80;
			}

			@keyframes blinking {
				50% {
					opacity: .3;
				}
			}

			#battery.dead {
				color: #e67e80;
				animation: blinking .6s ease infinite;
			}

			#tray menu {
				background-color: #232e33;
				color: #d3c6aa;
				font-family: Input Mono;
				font-size: 12pt;
			}

			#tray menu:hover {
				background-color: #d3c6aa;
				color: #232e33;
			}
		'';
	};
}