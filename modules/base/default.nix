{ pkgs, ... }:

{
  imports = [
    ./headless.nix
  ];

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    keyMap = "pl2";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings.auto-optimise-store = true;

  nix.settings.trusted-users = [
    "root"
    "@wheel"
  ];

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    vim
    nano
    htop
    btop
    tree
    unzip
    pciutils
    usbutils
    iw
  ];
}