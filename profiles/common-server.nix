{ ... }:
{
  imports = [
    ../modules/base
    ../modules/security/sops.nix
    ../modules/services/ssh.nix
    ../modules/users/serafin.nix
  ];
}