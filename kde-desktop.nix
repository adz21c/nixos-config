{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./nixos-config/kde-base.nix
    ];

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
}
