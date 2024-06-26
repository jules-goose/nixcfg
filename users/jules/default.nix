self:

{ config, lib, pkgs, ... }:

{
home.username = "jules";
home.homeDirectory = "/home/jules";

xdg.enable = true;

home.file."scripts".source = "${self}/scripts"; # pass 'self' in order to allow ./users/default.nix -> ./users/**/default.nix to access ${self}, to provide a path relative to flake.nix.

home = { 
    extraOutputsToInstall = [ "man" ]; # Additionally installs the manpages for each pkg

    packages = with  pkgs;
        [
        kitty
        vscode
        #qemu libvirt bridge-utils virt-manager virt-viewer spice-vdagent libguestfs
        #vulkan-tools
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
home.stateVersion = "23.11";
}
