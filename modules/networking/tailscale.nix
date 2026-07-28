{ config, lib, ... }:

let
  cfg = config.homelab.tailscale;
in
{
  options.homelab.tailscale = {
    enable = lib.mkEnableOption "Tailscale connectivity";
  };

  config = lib.mkIf cfg.enable {
    sops.secrets."tailscale-auth-key" = {
      mode = "0400";
    };

    services.tailscale = {
      enable = true;

      authKeyFile =
        config.sops.secrets."tailscale-auth-key".path;

      openFirewall = true;

      useRoutingFeatures = "none";
    };
  };
}