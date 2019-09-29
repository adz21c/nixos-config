{ lib, config, pkgs, ... }:
with lib:
let
  cfg = config.bacom.kde;
in {
  options.bacom.kde = {
    enable = mkEnableOption "KDE UI";
    desktop = mkOption {
	  type = types.boolean;
	  default = false;
	};
  };
  
  config = mkIf cfg.enable {
    services.xserver.desktopManager.plasma5.enable = true;

    environment.systemPackages = with pkgs; [
      ##############
      # Applications
      ##############
    
      # Compression
      pkgs.kdeApplications.ark
    
      # Image Management
      pkgs.kdeApplications.gwenview
    
      # Utilities
      pkgs.kdeApplications.kcalc
      pkgs.kdeApplications.okular
    
      # Maps
      pkgs.kdeApplications.marble
    
      ################
      # Infrastructure
      ################
    
      # Window and Desktop Management
      pkgs.kdeFrameworks.plasma-framework
      pkgs.plasma5.plasma-desktop
      pkgs.plasma5.plasma-workspace
      pkgs.plasma5.plasma-integration
      pkgs.plasma5.kwin
      pkgs.plasma5.kactivitymanagerd
      pkgs.plasma5.kdeplasma-addons
      pkgs.plasma5.kgamma5
      pkgs.plasma5.kscreen
      pkgs.plasma5.kscreenlocker
      pkgs.plasma5.kmenuedit
      pkgs.plasma5.systemsettings
      pkgs.ksuperkey
      pkgs.kdeFrameworks.kactivities
      pkgs.kdeFrameworks.kactivities-stats
      pkgs.kdeFrameworks.krunner
    
      # Multimedia
      pkgs.plasma5.plasma-pa
      pkgs.kdeFrameworks.kcodecs
      pkgs.kdeFrameworks.kmediaplayer
    
      # Localization
      pkgs.aspellDicts.en
      pkgs.aspellDicts.pt_BR
      pkgs.hunspellDicts.en-gb-ise
      pkgs.hunspellDicts.en-gb-ize
#      pkgs.kdeApplications.l10n.en_GB.qt4
#      pkgs.kdeApplications.l10n.en_GB.qt5
#      pkgs.kdeApplications.l10n.pt_BR.qt4
#      pkgs.kdeApplications.l10n.pt_BR.qt5
    
      # Utilities
      pkgs.kdeApplications.khelpcenter
      pkgs.kdeApplications.konsole
      pkgs.plasma5.kde-cli-tools
      pkgs.plasma5.khotkeys
      pkgs.plasma5.kinfocenter
    
      # File Management & Search
      pkgs.plasma5.milou
      pkgs.kdeApplications.dolphin
      pkgs.kdeApplications.dolphin-plugins
      pkgs.kdeFrameworks.kio
      pkgs.kdeApplications.kio-extras
      pkgs.kdeApplications.kmime
      pkgs.kdeApplications.filelight
    
      # Bluetooth
      pkgs.plasma5.bluedevil
    
      # Images & Docs
      pkgs.kdeApplications.ffmpegthumbs
      pkgs.kdeApplications.kdegraphics-mobipocket
      pkgs.kdeApplications.kdegraphics-thumbnailers
      pkgs.kdeFrameworks.kemoticons
      pkgs.kdeFrameworks.kimageformats
    
      # Networking
      pkgs.kdeFrameworks.networkmanager-qt
      pkgs.plasma5.plasma-nm
      pkgs.kdeApplications.kdenetwork-filesharing
      pkgs.plasma5.ksshaskpass
    
      # Power and Process Management
      pkgs.plasma5.ksysguard
      pkgs.plasma5.powerdevil
    
      # Themes
      pkgs.plasma5.kde-gtk-config
      pkgs.plasma5.kdecoration
    
      # Themes - Breeze
      pkgs.plasma5.breeze-gtk
      pkgs.breeze-icons
      pkgs.plasma5.breeze-qt5
      pkgs.plasma5.breeze-grub
    ]
	  ++ mkIf cfg.desktop {
	       environment.systemPackages = with pkgs; [
             ##############
             # Applications
             ##############
           
             # Maps
             pkgs.kdeApplications.marble
           
             ################
             # Infrastructure
             ################
           
             # PIM
             pkgs.kdeApplications.kcontacts
             pkgs.kdeApplications.akonadi
             pkgs.kdeApplications.akonadi-contacts
             pkgs.kdeApplications.akonadi-mime
             pkgs.kdeApplications.kwalletmanager
             pkgs.kdeFrameworks.kpeople
           
             # Themes - oxygen
             pkgs.plasma5.oxygen
           ];
	     };
  };
}
