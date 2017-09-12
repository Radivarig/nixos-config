{ ... }:

{
  # nmcli dev wifi list
  # nmcli dev wifi con "name" password "pw"
  networking = {
    hostName = "frozenlight";
    networkmanager.enable = true;
  };
}
