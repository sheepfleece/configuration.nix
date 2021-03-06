{ config, pkgs, ... }:

{
  imports =
    [
      ../hardware/touchpad.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Bluetooth
  hardware.bluetooth = { 
    enable = false;
    powerOnBoot = false;
  };

  # TLP daemon
  powerManagement.cpuFreqGovernor = "powersave";
  powerManagement.cpufreq.max = 3800000;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp1s0.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;
  networking.wireless = let 
    secrets = import ../secrets.nix;
  in {
    enable = true;
    networks = secrets.networks;
    extraConfig = ''
      ctrl_interface=/run/wpa_supplicant
      ctrl_interface_group=wheel
    '';
  };

  # services.udev.extraRules = let 
  #   path = with pkgs; lib.makeBinPath [ xorg.xinput ];
  #   deactivate = pkgs.writeShellScript "deactivate" ''
  #     PATH="$PATH":${path}
  #     XAUTHORITY="/home/sheep/.Xauthority"
  #     DISPLAY=":0"
  #     xinput disable "AT Translated Set 2 keyboard"
  #   '';
  # in ''
  #   ACTION=="add",  SUBSYSTEMS=="usb", ATTRS{product}=="USB Keyboard", RUN+="${deactivate}"
  # '';
}
