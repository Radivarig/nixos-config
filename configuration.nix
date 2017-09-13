{ config, pkgs, ... }:

{
  nix.nixPath=["nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos/nixpkgs:nixos-config=/etc/nixos/configuration.nix"];

  imports = [
    ./hardware-configuration.nix
    ./synaptics.nix
    ./keyboard.nix
    ./users.nix
    ./networking.nix
  ];

  boot.loader.grub = {
  	enable = true;
  	version = 2;
  	device = "/dev/sda";
  	splashImage = null;
  };

  # boot.loader.gummiboot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Zagreb";

  # search by name: nix-env -qaP | grep <packagename>
  environment.systemPackages = with pkgs; [
    wget
    htop

    nix-repl
    nixops

    unzip
    p7zip

    compton

    qalculate-gtk
    octaveFull

    git
    # kde5.kdiff3

    i3status
    dmenu

    sublime3

    # firefox
    chromium

    # blender

    ghc
    haskellPackages.stack
    haskellPackages.ghc-mod

    wine
    # winetricks
    # playonlinux

    shared_mime_info

    hexchat

    gimp

    epdfview
    transmission_gtk

    tldr
    termite							# minimal terminal
    gnumake m4          # make
    gcc

    lshw                # list all hardware

    # kde5.spectacle      # screenshots
    xlibs.xbacklight    # brightness

    xorg.xkill          # click kill x window
    xorg.xev            # evaluate input events

    xsel                # selection clipboard
    xbindkeys           # input events
    xdotool             # emulate input
    xlibs.xmodmap       # change keyboard map
  ];

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "radivarig" ];


  nixpkgs.config = {
    allowUnfree = true;

    # firefox = {
    #   enableGoogleTalkPlugin = true;
    #   enableAdobeFlash = true;
    # };

    chromium = {
      enablePepperFlash = true; # as no support for (NPAPI) plugins
      enablePepperPDF = true;
    };
  };

  programs.bash.enableCompletion = true;

  services.openssh.enable = true;
  # services.printing.enable = true;
  # services.teamviewer.enable = true;
  services.xserver.enable = true;

  # services.xserver.autorun = false;
  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
  };

#   services.xserver.displayManager = {
#     slim.defaultUser = "radivarig";
#     sessionCommands = ''
#       perl -MTime::HiRes=sleep -e 'sleep 0.0001 while 1' & # remove cpu noise
#     '';
#   };

  system.stateVersion = "17.03";
}
