{ config, pkgs, ... }:

{
  imports =
    [
      ./dualshock4.nix
      ./steam-controller.nix
      ./flashplayer.nix
    ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    pkgs.steam
    pkgs.dosbox
    pkgs.wine
    pkgs.retroarch
  ];

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
}
