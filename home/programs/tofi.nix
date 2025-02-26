{pkgs, ...}: {
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
}
