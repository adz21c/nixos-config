{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.bacom.games;
in {
  options.bacom.games = {
    enable = mkEnableOption "Gaming";
    steam = mkOption {
      type = types.boolean;
      default = true;
    };
    retro = mkOption {
      type = types.boolean;
      default = true;
    };
  };
  
  config = mkIf cfg.enable {
    hardware.steam-hardware.enable = true;
  
    environment.systemPackages = []
	  ++ mkIf cfg.steam [
        pkgs.steam
        pkgs.wine
      ]
	  ++ mkIf cfg.retro [
        pkgs.dosbox
        pkgs.retroarch
      ];
	mkIf cfg.retro {
      nixpkgs.config.retroarch = {
        enable4do = true;
        enableBeetlePCEFast = true;
        enableBeetlePSX = true;
        enableBeetleSaturn = true;
        enableBsnesMercury = true;
        enableDesmume = true;
        enableDolphin = true;
        enableFBA = true;
        enableFceumm = true;
        enableGambatte = true;
        enableGenesisPlusGX = true;
        enableHiganSFC = true;
        enableMAME = true;
        enableMGBA = true;
        enableMupen64Plus = true;
        enableNestopia = true;
        enableParallelN64 = true;
        enablePicodrive = true;
        enablePrboom = true;
        enablePPSSPP = true;
        enableQuickNES = true;
        enableReicast = true;
        enableScummVM = true;
        enableSnes9x = true;
        enableSnes9xNext = true;
        enableStella = true;
        enableVbaNext = true;
        enableVbaM = true;
      };
    };
  };
}
