{ config, pkgs, ... }:

{
  imports = 
    [ 
    ];

  programs.fish.enable = true;

  nixpkgs.config = { 
    allowUnfree = true; 
  };

  # services.lorri.enable = true;

  programs = {
    wireshark.enable = true;
    wireshark.package = pkgs.wireshark;
  };

  programs.ssh.startAgent = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; 
  [ 
      neovim

      # Web
      w3m wget cachix

      # Terminal
      fish alacritty ranger 

      # Dev
      man-pages clang-manpages posix_man_pages 
      ctags git cabal2nix direnv

      # Utils
      bat exa
      htop tree entr psmisc 
      unrar unzip zip p7zip
      fzf lsof ripgrep lsscsi
      neofetch upower tlp linuxPackages.cpupower
      binutils cloc

      # (import ./emacs.nix { inherit pkgs; })
    ];

  environment.variables.EDITOR = "vim";
}
