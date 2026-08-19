{ ... }:
{
  imports = [
    ../modules/base
    ../modules/services/directories.nix
    ../modules/security/sops.nix
    ../modules/services/ssh.nix
    ../modules/networking/tailscale.nix
    ../modules/networking/wifi.nix
    ../modules/virtualization/docker.nix
    ../modules/users/serafin.nix
  ];
}