# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "ohci_pci" "ehci_pci" "pata_atiixp" "xhci_pci" "usbhid" "sd_mod" ];
#  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];


  fileSystems."/" =
    { device = "/dev/disk/by-uuid/d9fe1471-29d9-4245-93f2-183d2d696481";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4B87-6096";
      fsType = "vfat";
    };

  fileSystems."/home/jules/DEV" =
    { device = "/dev/disk/by-uuid/2698b76d-8238-4ae7-bcb7-7e0d34aaa746";
      fsType = "ext4";
    };

  fileSystems."/home/jules/DATA" =
    { device = "/dev/disk/by-uuid/1d75a3a5-25cb-47c0-b34e-1fd745bb620f";
      fsType = "ext4";
    };

  fileSystems."/home/jules/VIRT" =
    { device = "/dev/disk/by-uuid/8b9b940e-a8e8-499b-bd34-13ba7e4533cd";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/6d05a00f-e1bf-4ff4-ba5c-e1d800522d9e"; }
    ];

}
