{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs;[
    rofi
    dunst
    lxappearance
    cinnamon.nemo
    feh
    arc-theme
    papirus-icon-theme
    adapta-gtk-theme
    noto-fonts

    ];
    xdg.configFile."i3/config".source = ./i3.conf;
    xdg.configFile."dunst/dunstrc".source = ./dunst/dunstrc;
}
