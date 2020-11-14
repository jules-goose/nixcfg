{
    description = "jules NixOs config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nur.url = "github:nix-community/NUR";
        home-manager.url = "github:nix-community/home-manager";
    };

	outputs = inputs:
/* ignore:: */ let ignoreme = ({config,lib,self,home-manager,nixpkgs,...}: with lib; { system.nixos.revision = mkForce null; system.nixos.versionSuffix = mkForce "pre-git"; }); in
{
    nixosConfigurations = {
		t480 = inputs.nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				(import ./hosts/mandrake/configuration.nix) #mandrake = main desktop
			inputs.home-manager.nixosModules.home-manager
			{
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.users = import ./users inputs.self; # pass 'self' in order to allow ./users/default.nix -> ./users/matthew/default.nix to access ${self}, to provide a path relative to flake.nix.
			}
        ];
        specialArgs = { inherit inputs; };
	};
    };
};
}