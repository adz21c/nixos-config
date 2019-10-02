{ pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs: rec {
    jellyfin = pkgs.callPackage pkgs/servers/jellyfin { };
  };
}
