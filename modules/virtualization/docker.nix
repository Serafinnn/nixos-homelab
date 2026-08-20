{ config, lib, ... }:

let
  cfg = config.homelab.docker;
in
{
  options.homelab.docker.enable =
    lib.mkEnableOption "Docker container runtime";

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      enableOnBoot = true;

      autoPrune = {
        enable = true;
        dates = "weekly";

        flags = [
          "--all"
          "--filter=until=336h"
        ];
      };
    };

    virtualisation.oci-containers.backend = "docker";
  };
}