{
  description = "the root of all flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprsunset.url = "github:hyprwm/hyprsunset";
    waybar.url = "github:alexays/waybar";
    sherlock.url = "github:Skxxtz/sherlock";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    ## set these for yourself please!!!
    system = "x86_64-linux";
    personal = {
      user = "vanta";
      hostname = "nixtop";
      time-zone = "America/Toronto";
      default-locale = "en_CA.UTF-8";
      city = "Toronto";
      cursor-size = 24;
    };
    ## other
    pkgs-unstable = inputs.unstable.legacyPackages.${system};
    args = {inherit inputs personal pkgs-unstable;};
  in {
    nixosConfigurations = {
      nixtop = nixpkgs.lib.nixosSystem {
        system = "${system}";

        # special args sent to configuration.nix
        specialArgs = args;

        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            # 'extra'? special args sent to home/default.nix (and all modules it includes)
            home-manager.extraSpecialArgs = args;

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.${personal.user} = import ./home;
          }
          # not technically my laptop's exact model, but close enough
          #nixos-hardware.nixosModules.dell-xps-13-9310
        ];
      };
    };
  };
}
