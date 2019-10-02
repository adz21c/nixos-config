{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  imports = [
    # modules
    ./modules/bacom/default.nix
    ./modules/bacom/games.nix
    ./modules/bacom/kde.nix
    ./modules/services/misc/jellyfin.nix
  ];

  callPackage = pkgs.lib.callPackageWith (pkgs // self);

  self = {
    jellyfin = callPackage pkgs/servers/jellyfin { };
  };
  in self