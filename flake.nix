{
  description = "jules NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    };

  outputs = { self, home-manager, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      mandrake = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (import ./hosts/mandrake/configuration.nix)
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users = import ./users self; # pass 'self' in order to allow ./users/default.nix -> ./users/matthew/default.nix to access ${self}, to provide a path relative to flake.nix.
          }
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
