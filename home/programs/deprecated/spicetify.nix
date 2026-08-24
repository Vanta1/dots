{
  pkgs,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  programs.spicetify = {
    enable = true;

    theme = spicePkgs.themes.default;
    colorScheme = "everforest";
    #customColorScheme = {
    #	text               = "D3C6AA";
    #	subtext            = "9da9a0";
    #	accent             = "E5C890";
    #	main               = "272e33";
    #	sidebar            = "272e33";
    #	player             = "272e33";
    #	card               = "272e33";
    #	shadow             = "1e2326";
    #	selected-row       = "626880";
    #	button             = "D3C6AA";
    #	button-active      = "949CBB";
    #	button-disabled    = "737994";
    #	tab-active         = "414559";
    #	notification       = "414559";
    #	notification-error = "e67e80";
    #	equalizer          = "F2D5CF";
    #	misc               = "626880";
    #};
  };
}
