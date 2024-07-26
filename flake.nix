{
	description = "the root of all flakes";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    	home-manager = {
      		url = "github:nix-community/home-manager/release-24.05";
      		inputs.nixpkgs.follows = "nixpkgs";
    	};
    	hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    	hyprland-plugins = {
      		url = "github:hyprwm/hyprland-plugins";
      		inputs.hyprland.follows = "hyprland";
    	};
    	waybar.url = "github:alexays/waybar";
    	nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  	};

	outputs = inputs@{ self, nixpkgs, home-manager, nixos-hardware, ... }:
	let
		## set these for yourself please!!!
		personal = {
			user = "vanta"; # your username
			hostname = "nixtop"; # your hostname
			time-zone = "America/Toronto";
			default-locale = "en_CA.UTF-8";

			# for git stuff
			user-name = "Vanta_1";
			user-email = "mcoopersandys@gmail.com";
		};
	in {
		nixosConfigurations = {
			nixtop = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";

				# special args sent to configuration.nix
				specialArgs = { inherit personal; };

				modules = [
					./configuration.nix
					home-manager.nixosModules.home-manager {
						# 'extra'? special args sent to home/default.nix (atm, extra packages and username)
						home-manager.extraSpecialArgs = { inherit inputs personal; };

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
