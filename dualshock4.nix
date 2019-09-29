{ config, pkgs, ... }:

{
  boot.kernelModules = boot.kernelModules ++ [ "uinput" ];

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

  services.udev.packages = [ pkgs.dualshock4-udev-rules ];
}
