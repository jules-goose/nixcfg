{
  description = "jules NixOS configuration";

  inputs = {
    nix-super.url = "git+https://git.privatevoid.net/max/nix-super?rev=6ff67e40b495e79aa6b2dc9356f1e9ade3b77bca&shallow=1";
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
    , nix-super
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
