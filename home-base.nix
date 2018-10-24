{ config, pkgs, ... }:

{
  # Select internationalisation properties.
  i18n = {
    consoleKeyMap = "uk";
    defaultLocale = "en_GB.UTF-8";
  };

  # Set your time zone.
  time = {
    timeZone = "Europe/London";
    hardwareClockInLocalTime = true;
  };

  # Ntp Daemon
  services.ntp.enable = true;
  services.ntp.servers = [
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
}
