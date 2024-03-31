{
  description = "jules NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs2305.url = "github:nixos/nixpkgs/nixos-23.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      
    };
    };

  outputs = 
  { 
    self
    , home-manager
    , nixpkgs
    , nixpkgs2305
    , ... 
    } @ inputs: {
    nixosConfigurations = {
      mandrake = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/mandrake/configuration.nix
          home-manager.nixosModules.home-manager
        ];
        specialArgs = { inherit inputs; };
      };
      treaka = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/treaka/configuration.nix
          home-manager.nixosModules.home-manager
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
