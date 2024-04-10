{
  description = "the root of all flakes";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: 
  let 
    # enter your username here
    user = "vanta";
  in {
    nixosConfigurations = {
      nixtop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        # special args sent to configuration.nix
        specialArgs = { inherit user; };

        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager {
            # 'extra'? special args sent to home/default.nix
	          home-manager.extraSpecialArgs = { inherit inputs user; };

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.${user} = import ./home;
          }
        ];
      };
    };
  };
}