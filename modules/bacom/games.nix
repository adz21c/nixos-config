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
    users.groups.games = {};
	
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
	
    hardware.steam-hardware.enable = true;
	
	# Dualshock 4 rules
	#boot.kernelModules = boot.kernelModules ++ [ "uinput" ];

    nixpkgs.config.packageOverrides = pkgs: {
      dualshock4-udev-rules = pkgs.writeTextFile {
        name = "dualshock4-udev-rules";
        text = ''
          # DualShock 4 over USB hidraw
          KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="05c4", MODE="0666"
  
          # DualShock 4 wireless adapter over USB hidraw
          KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ba0", MODE="0666"
  
          # DualShock 4 Slim over USB hidraw
          KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="09cc", MODE="0666"
  
          # DualShock 4 over bluetooth hidraw
          KERNEL=="hidraw*", KERNELS=="*054C:05C4*", MODE="0666"
  
          # DualShock 4 Slim over bluetooth hidraw
          KERNEL=="hidraw*", KERNELS=="*054C:09CC*", MODE="0666"
        '';
        destination = "/etc/udev/rules.d/99-duashock4.rules";
      };
    };

    #services.udev.packages = services.udev.packages ++ [ pkgs.dualshock4-udev-rules ];
  };
}
