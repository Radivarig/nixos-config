{ config, pkgs, ... }:

{
  services.xserver.synaptics = {
    enable = true;
    twoFingerScroll = true;
    tapButtons = false;
    additionalOptions = ''
      Option "TapButton2" "2"
      Option "CoastingSpeed" "0"
    '';
  };
}
