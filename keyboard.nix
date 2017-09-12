{ ... }:

{
  services.xserver = {
    layout = "hr, us";
    # xkbModel = "pc104";
    xkbVariant = "qwerty";
    xkbOptions = "grp:alt_space_toggle";
  };

  i18n = {
    # consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "croat";
    # defaultLocale = "en_US.UTF-8";
  };

}
