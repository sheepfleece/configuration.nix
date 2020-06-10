{ pkgs, ... }:


with pkgs;
let 
  emacsWithPkgs = (emacsPackagesGen emacs).emacsWithPackages;

in 
  emacsWithPkgs (epkgs: (with epkgs.melpaStablePackages; [ 
    zerodark-theme
    evil
    cargo
    haskell-mode
    elm-mode
    nix-mode
    idle-highlight-mode
  ])
) 
