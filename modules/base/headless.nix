{ ... }:
{
  #disable graphical env
  services.xserver.enable = false;

  #turn the console off after 60s inactivity
  boot.kernelParams = [
    "consoleblank=60"
  ];

  #make closing the lid do nothing
  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandleLidSwitchExternalPower = "ignore";
    HandleLidSwitchDocked = "ignore";

    #dont sleep due to inactivity
    IdleAction = "ignore";
  };

}