{ config, pkgs, ... }:

{
  # Related packages
  environment.systemPackages = 
    let
      my-xmonad = pkgs.xmonad-with-packages.override { 
        packages = p: with p; [ xmonad-contrib xmonad-extras xmonad ]; 
      };
    in with pkgs; [ 
      autorandr
      xclip     # Clipboard
      xmobar
      xdotool
      my-xmonad
    ];


  # Enable the X11 windowing system.
  services.xserver = { 
    enable = true;
    layout = "by(latin),pl,ru";
    xkbOptions = "grp:alt_shift_toggle";

    # Explicitly disable for xmonad to start
    desktopManager.plasma5.enable = true;
    displayManager.defaultSession = "plasma5";

    displayManager = { 
      sddm.enable = true;
    };
  };

}
