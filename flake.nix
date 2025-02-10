{
  description = "the root of all flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    waybar.url = "github:alexays/waybar";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    ## set these for yourself please!!!
    personal = {
      user = "vanta";
      hostname = "nixtop";
      time-zone = "America/Toronto";
      default-locale = "en_CA.UTF-8";
      city = "Toronto";

      # for git stuff
      user-name = "Vanta_1";
      user-email = "mcoopersandys@gmail.com";
    };
  in {
    nixosConfigurations = {
      nixtop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        # special args sent to configuration.nix
        specialArgs = {inherit inputs personal;};

        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            # 'extra'? special args sent to home/default.nix (atm, extra packages and username)
            home-manager.extraSpecialArgs = {inherit inputs personal;};

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
