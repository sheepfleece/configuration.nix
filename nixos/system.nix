{ config, pkgs, ... }:

{
  
  fonts.enableDefaultFonts = true;
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };
  console = {
    keyMap = "us";
    font = "Lat2-Terminus16";
  };

  # Set your time zone.
  time.timeZone = "Europe/Minsk";

  # Enable sound.
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages32 = 
    with pkgs.pkgsi686Linux; [ libva ];
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    support32Bit = true;
  };

  # Changing brightness
  programs.light.enable = true;

  # Enable printer
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplipWithPlugin_3_16_11 ];

  services.upower.enable = true;
  systemd.services.upower.enable = true;

  # Auto clean-up
  nix.optimise.automatic = true;
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 8d";

  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;
  services.mysql.initialDatabases = [
  ];
  services.mysql.bind = "127.0.0.1";
  services.mysql.ensureUsers = [
    { 
      name = "sheep"; 
      ensurePermissions = {"*.*" = "ALL PRIVILEGES";} ; 
    }
  ];

  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # users.extraGroups.vboxusers.members = [ "sheep" ];

  boot.extraModprobeConfig = ''
    blacklist uvcvideo
  '';

}
