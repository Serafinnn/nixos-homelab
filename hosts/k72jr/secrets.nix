{ ... }:

{
  sops = {
    defaultSopsFile = ../../secrets/k72jr.yaml;
    defaultSopsFormat = "yaml";

    secrets."test/token" = {
      owner = "serafin";
      group = "users";
      mode = "0400";
    };
  };
}