{ ... }:

{
  imports = [
    ./disk-config.nix
    ../../modules/boot/uefi.nix
    ../../profiles/common-server.nix
  ];

  sops.defaultSopsFile = ../../secrets/ideapad.yaml;

  networking = {
    hostName = "ideapad";
    useDHCP = false;
  };

  networking.interfaces = {
    enp0s21f0u5.useDHCP = true;
    wlp2s0.useDHCP = true;
  };

  homelab.tailscale.enable = true;
  homelab.docker.enable = true;
  hardware.enableRedistributableFirmware = true;

  system.stateVersion = "26.05";
}