{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.bacom.games;
in {
  options.bacom.games = {
    enable = mkEnableOption "Gaming";
    steam = mkOption {
      type = types.bool;
      default = true;
    };
    retro = mkOption {
      type = types.bool;
      default = true;
    };
  };
  
  config = mkIf cfg.enable {
    hardware.steam-hardware.enable = true;
  
    environment.systemPackages = [ ]
      ++ (if cfg.steam then [ pkgs.steam pkgs.wine ] else [])
      ++ (if cfg.retro then [ pkgs.dosbox pkgs.retroarch ] else []);
    nixpkgs.config.retroarch = mkIf cfg.retro {
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
}
