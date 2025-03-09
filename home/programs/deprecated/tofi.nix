{
  pkgs,
  personal,
  lib,
  ...
}: {
  home.packages = [pkgs.tofi];
  xdg.configFile."tofi/config".text = ''
    # Text
    font = "Fira Sans"
    text-color = #d3c6aa
    prompt-text = "<|:3 "
    selection-color = #a7c080

    # Window
    width = 100%
    height = 100%
    border-width = 0
    background-color = #1e2326ee
    padding-left = 35%
    padding-top = 35%
    num-results = 5
    result-spacing = 5
    outline-width = 0
  '';

  home.activation = {
    # tofi-drun won't detect newly installed applications unless you manually delete the cache, so that it has to rebuild it
    # send all output to /dev/null to suppress "file does not exist" errors, and run it in the background and discard the output
    # because nixos-rebuild will still check the result of the command
    refreshTofi = lib.hm.dag.entryAfter ["writeBoundary"] ''
      echo "refreshing tofi cache..."
      rm /home/${personal.user}/.cache/tofi-drun &> /dev/null &!
    '';
  };
}
