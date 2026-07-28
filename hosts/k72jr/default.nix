{ ... }:

{
  imports = [
    ./disk-config.nix
    ./secrets.nix

    ../../profiles/common-server.nix
  ];

  networking = {
    hostName = "k72jr";
    useDHCP = true;
  };

  system.stateVersion = "26.05";
}