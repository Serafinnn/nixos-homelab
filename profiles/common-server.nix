{ ... }:
{
  imports = [
    ../modules/base
    ../modules/security/sops.nix
    ../modules/services/ssh.nix
    ../modules/networking/tailscale.nix
    ../modules/virtualization/docker.nix
    ../modules/users/serafin.nix
  ];
}