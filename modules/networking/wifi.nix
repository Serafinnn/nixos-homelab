{ config, ... }:

{
  sops.secrets."wifi/password" = {
    sopsFile = ../../secrets/common.yaml;
  };

  sops.templates."wifi-secrets.conf" = {
    content = "wifi_psk=${config.sops.placeholder."wifi/password"}\n";

    owner = "root";
    group = config.users.users.wpa_supplicant.group;
    mode = "0440";

    restartUnits = [
      "wpa_supplicant.service"
    ];
  };

  networking.wireless = {
    enable = true;

    secretsFile =
      config.sops.templates."wifi-secrets.conf".path;

    networks."Orange_Swiatlowod_82A8" = {
      pskRaw = "ext:wifi_psk";
    };
  };
}