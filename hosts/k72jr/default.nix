{ ... }:

{
  imports = [
    ./disk-config.nix
    ../../modules/boot/legacy.nix
    ../../profiles/common-server.nix

    ../../modules/virtualization/containers/whoami.nix
  ];

  sops.defaultSopsFile = ../../secrets/k72jr.yaml;

  networking = {
    hostName = "k72jr";
    useDHCP = true;
  };

  homelab.tailscale.enable = true;
  homelab.docker.enable = true;
  homelab.containers.whoami.enable = true;

  system.stateVersion = "26.05";
}