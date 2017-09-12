{ ... }:

{
  # passwd user
  users.extraUsers.radivarig = { 
    isNormalUser = true;
    home = "/home/radivarig";
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
