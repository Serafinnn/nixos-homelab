{ ... }:

{
  imports = [
    ./disk-config.nix

    ../../modules/base
    ../../modules/users/serafin.nix
    ../../modules/services/ssh.nix
  ];

  networking = {
    hostName = "k72jr";
    useDHCP = true;
  };

  system.stateVersion = "26.05";
}