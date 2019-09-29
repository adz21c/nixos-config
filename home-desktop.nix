{ config, pkgs, ... }:

{
  imports = [ ./home-base.nix ];

  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    ##############
    # Applications
    ##############

    # Web Browser
    pkgs.firefoxWrapper
    pkgs.flashplayer

    # Compression
    pkgs.p7zip

    # Text editors
    pkgs.kdeApplications.kate

    # Video editing and playback
    pkgs.vlc

    # Bluetooth
    pkgs.bluez

    # Networking
    pkgs.samba
  ];

  hardware.bluetooth.enable = true;

  # PulseAudio
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  # 3D 32Bit apps
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "gb";
  };
}
