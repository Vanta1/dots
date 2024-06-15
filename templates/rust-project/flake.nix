# this is mostly from https://fasterthanli.me/series/building-a-rust-service-with-nix/part-10#a-flake-with-derivation

let 
  name = "Vanta1 default rust template";
in
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
  };
  outputs = { self, nixpkgs, flake-utils, rust-overlay }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          overlays = [ (import rust-overlay) ];
          pkgs = import nixpkgs {
            inherit system overlays;
          };
          rustToolchain = pkgs.pkgsBuildHost.rust-bin.selectLatestNightlyWith (toolchain: toolchain.default);
          nativeBuildInputs = with pkgs; [ rustToolchain pkg-config ];
          buildInputs = with pkgs; [ 
            # extra packages go here...
          ];
        in
        with pkgs;
        {
          devShells.default = mkShell {
            inherit buildInputs nativeBuildInputs;
            LD_LIBRARY_PATH = "${lib.makeLibraryPath buildInputs}";
            shellHook = ''
              echo "entering ${name} devshell..."
            '';
          };
        }
      );
}