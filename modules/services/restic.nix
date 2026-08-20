{ config, ... }:
{
  sops.secrets."restic/s3_access_key_id" = {
    sopsFile = ../../secrets/common.yaml;
  };
  
  sops.secrets."restic/s3_secret_access_key" = {
    sopsFile = ../../secrets/common.yaml;
  };
  
  sops.secrets."restic/password" = { };

  sops.templates."restic-env" = {
    content = ''
      AWS_ACCESS_KEY_ID=${config.sops.placeholder."restic/s3_access_key_id"}
      AWS_SECRET_ACCESS_KEY=${config.sops.placeholder."restic/s3_secret_access_key"}
    '';
  };

  services.restic.backups.main = {
    initialize = true;

    repository =
      "s3:s3.eu-north-1.amazonaws.com/serafin-homelab-backups-037063406021-eu-north-1-an/k72jr";

    passwordFile =
      config.sops.secrets."restic/password".path;

    environmentFile =
      config.sops.templates."restic-env".path;

    paths = [
      "/srv/apps"
      "/srv/data"
      "/srv/shared"
    ];

    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };

    pruneOpts = [
      "--keep-daily 7"
      "--keep-weekly 4"
      "--keep-monthly 6"
    ];

    createWrapper = true;
  };
}