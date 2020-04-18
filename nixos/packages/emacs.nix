{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;    
  let 
    emacsWithPkgs = (emacsPackagesGen emacs).emacsWithPackages;
  in
  [ (emacsWithPkgs (epkgs: (with epkgs.melpaStablePackages; [ evil ])) )];
}
