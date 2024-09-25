#
# This file represents safe opinionated defaults for a basic Phosh system.
#
# NOTE: this file and any it imports **have** to be safe to import from
#       an end-user's config.
#
{ config, lib, pkgs, options, ... }:

{
  mobile.beautification = {
    silentBoot = lib.mkDefault true;
    splash = lib.mkDefault true;
  };

  services.xserver.desktopManager.phosh = {
    enable = true;
    group = "users";
  };
  services.xserver.libinput.enable = true;
  programs.calls.enable = true;

  environment.systemPackages = with pkgs; [
    firefox
    vim
    git
    wget
    mpv
    podman
    nmon
    htop
    cmus
    neofetch
    kgx                 # Terminal
  ];

  hardware.sensor.iio.enable = true;
  sound.enable = true;
  nixpkgs.config.pulseaudio = true;
  hardware.pulseaudio.enable = true;

  assertions = [
    { assertion = options.services.xserver.desktopManager.phosh.user.isDefined;
    message = ''
      `services.xserver.desktopManager.phosh.user` not set.
        When importing the phosh configuration in your system, you need to set `services.xserver.desktopManager.phosh.user` to the username of the session user.
    '';
    }
  ];
}
