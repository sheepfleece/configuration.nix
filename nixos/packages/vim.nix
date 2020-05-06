{ config, pkgs, lib, ... }:

with pkgs;
let 
  plugins = with vimPlugins; [
    ReplaceWithRegister
    fzf-vim 
    fzfWrapper 
    ghcid
    haskell-vim
    nerdtree 
    vim-commentary
    vim-fugitive
    vim-repeat
    vim-nix
    vim-sort-motion
    vim-stylishask
    vim-surround
    vim-textobj-user
    vim-haskellFold
    youcompleteme
  ];

  vim-haskellFold = vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-haskellFold";
    version = "1.0.0";
    src = fetchFromGitHub {
      owner = "Twinside";
      repo = "vim-haskellFold";
      rev = "81841ee56ec91327c44a488a7d6eb921ff4d4820";
      sha256 = "145ng6blvviidn0dkyiqnl21dswg5v16yynq87mqv340gc4gnbxq";

    };
    dependencies = [];
  };

  nvim = neovim.override {
    vimAlias = true;
    configure = {
      customRC = "source $HOME/.vimrc";
      vam.pluginDictionaries = lib.singleton { 
        names = plugins;
      };
    };
  };

in
{
  environment.systemPackages = lib.singleton nvim;
}
