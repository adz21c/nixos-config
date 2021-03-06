{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.bacom;
in {
  options.bacom = {
    enable = mkEnableOption "Bacom";
    desktop = mkOption {
      type = types.bool;
      default = false;
    };
  };
  
  config = mkIf cfg.enable {
    boot.loader.systemd-boot.enable = true;

    # Select internationalisation properties.
    i18n = {
      consoleKeyMap = "uk";
      defaultLocale = "en_GB.UTF-8";
      supportedLocales = [ "en_GB.UTF-8/UTF-8" "pt_BR.UTF-8/UTF-8" ]; 
    };
    
    # Set your time zone.
    time = {
      timeZone = "Europe/London";
      hardwareClockInLocalTime = true;
    };
    
    # Ntp Daemon
    networking.timeServers = [
      "0.uk.pool.ntp.org"
      "1.uk.pool.ntp.org"
      "2.uk.pool.ntp.org"
      "3.uk.pool.ntp.org"
    ];
    
    # Fonts
    fonts = {
      enableDefaultFonts = true;
      enableCoreFonts = true;
      enableGhostscriptFonts = true;
      fonts = with pkgs; [
        corefonts
        inconsolata
        ubuntu_font_family
        unifont
      ];
    };
  
    # Enable the X11 windowing system.
    services.xserver = mkIf cfg.desktop {
      enable = true;
      layout = "gb";
    };
    
    environment.systemPackages = (if cfg.desktop then [
      ##############
      # Applications
      ##############
  
      # Web Browser
      pkgs.chromium
      pkgs.firefoxWrapper
      pkgs.flashplayer
  
      # Compression
      pkgs.p7zip
  
      # Text editors
      pkgs.kdeApplications.kate
  
      # Video editing and playback
      pkgs.vlc
    ] else []);
    
    services.samba = mkIf cfg.desktop {
      enable = true;
      enableNmbd = true;
      enableWinbindd = true;
    };
  };
}
