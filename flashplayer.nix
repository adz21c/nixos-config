{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

#  nixpkgs.config.packageOverrides = pkgs: {
#    flashplayer = pkgs.lib.overrideDerivation pkgs.flashplayer (attrs: {
#      name = "flashplayer-27.0.0.126";
#      version = "28.0.0.126";
#      src = pkgs.fetchurl {
#        url = "https://fpdownload.adobe.com/get/flashplayer/pdc/28.0.0.126/flash_player_npapi_linux.x86_64.tar.gz";
#        sha256 = "6c61375919ebd70b451bead30993617cbb47eeb7c2be448c561ff55de31fb77c";
#      };
#    });
#  };
}
