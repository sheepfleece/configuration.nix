{ config, pkgs, ... }:

{
  imports = 
    [ 
      ./shell.nix
      ./vim.nix
    ];

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
    [ # web 
      firefox tixati w3m 

      # steam wine 

      # media
      mpv zathura ranger sxiv feh jrnl anki
      gimp imagemagick libreoffice 

      # dev
      man-pages clang-manpages posix_man_pages 
      ctags git cabal2nix
      # cabal2nix git nix-prefetch-git 
      # gitAndTools.git-annex gitAndTools.gitflow
      direnv

      # utils
      htop tree entr wget psmisc unrar
      unzip zip fzf highlight lsof ripgrep lsscsi
      neofetch upower tlp linuxPackages.cpupower
      binutils cloc
      
      # shell/terminal
      fish alacritty tmux

      # etc
      pandoc

      # (import ./emacs.nix { inherit pkgs; })
    ];

  environment.variables.EDITOR = "vim";
}
