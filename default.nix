{ pkgs, ... }:

{
  imports = [
    ./modules/bacom/default.nix
    ./modules/bacom/kde.nix
    ./modules/bacom/games.nix
  ];

#  nixpkgs.config.packageOverrides = pkgs: rec {
#    jellyfin = pkgs.callPackage pkgs/servers/jellyfin { };
#  };
}
