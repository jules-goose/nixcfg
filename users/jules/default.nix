self:

{ config, lib, pkgs, ... }:

{
imports =
    [
      ./modules
    ];

home.username = "jules";
home.homeDirectory = "/home/jules";

programs.home-manager.enable = true;

xdg.enable = true;

home.file."scripts".source = "${self}/scripts"; # pass 'self' in order to allow ./users/default.nix -> ./users/matthew/default.nix to access ${self}, to provide a path relative to flake.nix.
home.file.".config".source = "${self}/.config";



home = { 
    extraOutputsToInstall = [ "man" ]; # Additionally installs the manpages for each pkg

    packages = with  pkgs;
        [
	discord
	google-chrome
	vscode
	qemu
	docker
        ];
    };

# This value determines the Home Manager release that your
# configuration is compatible with. This helps avoid breakage
# when a new Home Manager release introduces backwards
# incompatible changes.
#
# You can update Home Manager without changing this value. See
# the Home Manager release notes for a list of state version
# changes in each release.
home.stateVersion = "20.03";
}
