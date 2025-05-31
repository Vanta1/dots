{
  pkgs,
  inputs,
  personal,
  ...
}: {
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
          # workspace module already has padding, so here i use a separator without padding-left to make the space on either side equal
          "custom/workspace-separator"
          "custom/weather" # see TODO for the module
        ];
        modules-center = [
          "clock#date"
          "custom/separator"
          "clock#time"
          # separator built in to spotify-pause;
          "custom/spotify-pause"
          "custom/spotify"
          #"image#spotify-art"
        ];
        modules-right = [
          "tray"
          "idle_inhibitor"
          "custom/separator"
          # TODO: figure out if this or some kind of manual solution involving workspaces would be better for minimizing windows,,,, i probably want to make my own cause that seems fun
          # "taskbar" "custom/separator",
          "wireplumber"
          "custom/separator"
          "battery"
        ];
        "custom/separator" = {
          format = "|";
          tooltip = false;
        };
        "custom/workspace-separator" = {
          format = "|";
          tooltip = false;
        };
        "hyprland/workspaces" = {
          "persistent-workspaces" = {
            "*" = 8;
          };
        };
        "custom/weather" = {
          # this will be broken on your first install, get ur own damn api key!
          exec = "/home/${personal.user}/bin/vanta1/get_weather.sh";
          on-click = "/home/${personal.user}/bin/vanta1/notify_weather.sh";
          format = "WTR {}";
          interval = 900;
          tooltip = false;
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
        #"image#spotify-art" = {
        #	path = "/tmp/album_art.jpeg";
        #	interval = 5;
        #	size = 30;
        #};
        "custom/spotify-pause" = {
          exec = "/home/${personal.user}/bin/vanta1/get_paused.sh";
          on-click = "playerctl play-pause";
          tooltip = false;
        };
        "custom/spotify" = {
          exec = "/home/${personal.user}/bin/vanta1/get_playing.sh";
          on-click = "playerctl play-pause";
          tooltip = false;
        };
        # removed in favor of haivng idle_inhibitor disguised as part of the tray >:3
        #"group/tray" = {
        #  orientation = "horizontal";
        #  modules = [
        #    "tray"
        #    "custom/separator"
        #  ];
        #};
        tray = {
          spacing = 9;
          show-passive-icons = true;
        };
        wireplumber = {
          format = "VOL {volume}";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };
        network = {
          format-wifi = "NET {essid}";
          format-disconnected = "NET disconnected";
          max-length = 50;
          tooltip = true;
          tooltip-format = "STR {signalStrength}";
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
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
    style = let
      font-family = "'Monaspace Xenon'";
    in ''
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
      	font-family: ${font-family};
      	font-size: 12pt;
        font-weight: normal;
      }

      #custom-separator {
      	margin-bottom: 3px;
      	padding-left: 6px;
      	padding-right: 6px;
      }

      #custom-workspace-separator {
      	margin-bottom: 3px;
      	padding-left: 0px;
      	padding-right: 6px;
      }

      #custom-spotify-pause {
      	margin-top: 0px;
        margin-bottom: 2px;
        margin-left: 6px;
        margin-right: 8px;
        padding: 0px;
      }

      tooltip {
      	background-color: #272e33;
      	border: 1px solid #9da9a0;
        font-family: ${font-family};
      }

      /*
      tooltip:hover {
      	background-color: #272e33;
      }
      */

      tooltip label {
      	color: #d3c6aa;
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
      	box-shadow: none;
      	text-shadow: none;
      	background: #2e383c;
      	border: 0px solid #2e383c;
      	padding: 0 3px;
      	font-size: 12pt;
      }

      #tray menu {
      	background-color: #232e33;
      	color: #d3c6aa;
      	font-size: 12pt;
      }

      #tray menu:hover {
      	background-color: #d3c6aa;
      	color: #232e33;
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

      #idle_inhibitor {
        font-family: 'Font Awesome 6 Free';
        padding-left: 9px;
      }

      #idle_inhibitor.activated {
      	color: #e67e80;
      }

      #idle_inhibitor.deactivated {
      	color: #9da9a0;
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
    '';
  };
}
