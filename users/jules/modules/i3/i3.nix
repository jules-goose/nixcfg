{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.profiles.i3;
in {
  options.profiles.i3 = {
    enable = mkEnable "Whether to enable i3 profile.";
    primaryMonitor = mkOption {
      description = "Identifier of the primary monitor";
      type = types.str;
      default = "eDP1";
    };

    secondaryMonitor = mkOption {
      description = "Identifier of the secondary monitor";
      type = types.str;
      default = "HDMI1";
    };

    terminal = mkOption {
      description = "Command to start terminal";
      type = types.str;
      default = config.profiles.terminal.command;
    };

    background = mkOption {
      description = "Background image to use";
      type = types.package;
      default = pkgs.fetchurl {
        url = "https://i.redd.it/szkzdvg2lu5x.png";
        sha256 = "0lsrjsbwm5678an31282vp703gkzy1nin2l0v37g240zgxi3d5zq";
      };
    };
  };

  config = mkIf cfg.enable {
    profiles.x11 = {
      enable = true;
      compositor = mkDefault true;
      displayManager = true;
    };

    services.xserver.windowManager.default = mkDefault "i3";
    services.xserver.windowManager.i3 = {
      enable = mkDefault true;
      extraSessionCommands = ''
        ${pkgs.feh}/bin/feh --bg-fill ${cfg.background}
        ${pkgs.dunst}/bin/dunst &
       '';
      configFile = "./i3.conf"
    };
    environment.systemPackages = with pkgs; [
        i3status
        acpi
        rofi
        rofi-pass
        st
     ];
  };
}
