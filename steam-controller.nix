{ config, pkgs, ... }:

{
  boot.kernelModules = [ "uinput" ];

  nixpkgs.config.packageOverrides = pkgs: {
    steamcontroller-udev-rules = pkgs.writeTextFile {
      name = "steamcontroller-udev-rules";
      text = ''
        # Valve USB devices
        SUBSYSTEM=="usb", ATTRS{idVendor}=="28de", MODE="0666"

        # Steam Controller udev write access
        KERNEL=="uinput", SUBSYSTEM=="misc", TAG+="uaccess", TAG+="udev-acl"
	# This rule is necessary for gamepad emulation
        KERNEL=="uinput", MODE="0666", GROUP="users", OPTIONS+="static_node=uinput"

        # Valve HID devices over USB hidraw
        KERNEL=="hidraw*", ATTRS{idVendor}=="28de", MODE="0666"

        # Valve HID devices over bluetooth hidraw
        KERNEL=="hidraw*", KERNELS=="*28DE:*", MODE="0666
      '';
      destination = "/etc/udev/rules.d/99-steamcontroller.rules";
    };
  };

  services.udev.packages = [ pkgs.steamcontroller-udev-rules ];
}
