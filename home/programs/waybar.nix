{ config, pkgs, inputs, ... }: {
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
        ];
        modules-right = [
          "tray"        "custom/separator"
          # "taskbar",      "custom/separator", // TODO: figure out if this or some kind of manual solution involving workspaces would be better for minimizing windows,,,, i probably want to make my own cause that seems fun
          "wireplumber" "custom/separator"
          "network"     "custom/separator"
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
          tooltip = false;
        };
        "clock#time" = {
          format = "{:%I:%M %p}";
          tooltip = false;
        };
        tray = {
          spacing = 9;
        };
        wireplumber = {
          format = "VOL {volume}";
        };
        network = {
          format-wifi = "NET {essid}";
          format-disconnected = "NET disconnected";
          max-length = 50;
          tooltip = false;
        };
        battery = {
          interval = 60;
          states = {
              warning = 30;
              critical = 15;
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

      #workspaces button {
          color: #d3c6aa;
          padding: 0 3px;
          border-radius: 0;
      }

      #workspaces button.empty {
          color: #9da9a0;
      }

      #workspaces button.active {
          background-color: #374145;
          color : #d3c6aa;
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
    '';
  };
}