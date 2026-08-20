{ config, lib, ... }:

let
  cfg = config.homelab.containers.whoami;
in
{
  options.homelab.containers.whoami.enable =
    lib.mkEnableOption "Test whoami container";

  config = lib.mkIf cfg.enable {
    virtualisation.oci-containers.containers.whoami = {
      image = "traefik/whoami:v1.11.0";
      autoStart = true;

      ports = [
        "127.0.0.1:8080:80"
      ];
    };
  };
}