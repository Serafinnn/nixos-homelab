{ ... }:

{
  users.users.serafin = {
    isNormalUser = true;
    description = "Serafin";

    extraGroups = [
      "wheel"
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfq+bOgSaIb7p9pCkJaUGKSUx7ogj7O9diFKli1Bhtj lukas@DESKTOP-SERAFIN"
    ];
  };

  security.sudo.wheelNeedsPassword = false;
}