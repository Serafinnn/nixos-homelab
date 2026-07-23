{ ... }:

{
  imports = [
    ./disk-config.nix
    ./secrets.nix

    ../../modules/base
    ../../modules/security/sops.nix
    ../../modules/users/serafin.nix
    ../../modules/services/ssh.nix
  ];

  networking = {
    hostName = "k72jr";
    useDHCP = true;
  };

  system.stateVersion = "26.05";
}