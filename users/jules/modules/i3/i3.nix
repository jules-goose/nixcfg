{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs;[
    rofi
    ];
    xdg.configFile."i3/config".source = ./i3.conf;
}
