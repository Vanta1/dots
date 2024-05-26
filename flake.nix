{
  description = "the root of all flakes";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    # unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nixos-hardware, ... }: 
  let 
    # enter your username here, TODO: i could add some more fields here, but it was mostly just an experiment to get familiar with nix
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
            # 'extra'? special args sent to home/default.nix (atm, extra packages and username)
            home-manager.extraSpecialArgs = { inherit inputs user; };

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.${user} = import ./home;
          }
          # not technically my laptop's exact model, but close enough
          #nixos-hardware.nixosModules.dell-xps-13-9310
        ];
      };
    };
  };
}