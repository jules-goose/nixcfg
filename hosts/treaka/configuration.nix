# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
    imports =
    [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
#      ./modules
#      ./cachix.nix
    ];

nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
    experimental-features = nix-command flakes
    '';
};

# Use the systemd-boot EFI boot loader.
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
virtualisation.libvirtd.enable = true;


#gpu setup
#boot.initrd.kernelModules = [ "amdgpu" ];
#hardware.opengl.extraPackages = with pkgs; [
#   rocm-opencl-icd
#   rocm-opencl-runtime
#   amdvlk
#];
## For 32 bit applications
#hardware.opengl.extraPackages32 = with pkgs; [
#driversi686Linux.amdvlk
#];  
# enable vulkan
#hardware.opengl.driSupport = true;
# For 32 bit applications
#hardware.opengl.driSupport32Bit = true;





networking.hostName = "treaka"; # Define your hostname.


  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = import "${inputs.self}/users";
    extraSpecialArgs = {
      inherit inputs;
      headless = false;
    };
  };
  
# The global useDHCP flag is deprecated, therefore explicitly set to false here.
# Per-interface useDHCP will be mandatory in the future, so this generated config
# replicates the default behaviour.
networking.useDHCP = true;


    # List packages installed in system profile. To search, run:
    # $ nix search wget
    # need to refactor this so both host use the same packages specification
    environment.systemPackages = with pkgs; [
        wget 
        vim
        mpv
        htop
        vimPlugins.vim-addon-nix
        git
        gparted
        clinfo
];
    #virtualisation.docker.enable= true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.jules = {
        isNormalUser = true;
        extraGroups = [ "sudo" "input" "wheel" "audio" "libvirtd"]; # Enable ‘sudo’ for the user.
    };


    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
        font = "Lat2-Terminus16";
        keyMap = "fr";
    };

    # Set your time zone.
    time.timeZone = "Europe/Paris";

    # Set location provider
    location.provider = "geoclue2";

    # Enable OpenGL
    hardware.opengl.enable = true;

    # Enable sound.
    # sound.enable = true;
    #hardware.pulseaudio.enable = true;

    # List services that you want to enable:
    nixpkgs.config.allowUnfree = true;

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    # x window system
    services.sway.enable = true;
    
    # desktop manager
    

    # display manager
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.displayManager.autoLogin.enable = true;
    services.xserver.displayManager.autoLogin.user = "jules";
    # keyboard layout
    services.xserver.layout = "fr"; 


   system.stateVersion = "23.11";
}
