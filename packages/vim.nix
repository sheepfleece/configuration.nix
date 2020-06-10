{ config, pkgs, lib, ... }:

with pkgs;
let 
  plugins = with vimPlugins; [
    fzf-vim 
    fzfWrapper 
    nerdtree 
    tagbar
    vim-commentary
    ReplaceWithRegister
    vim-fugitive
    vim-haskellFold
    vim-nix
    vim-repeat
    vim-sort-motion
    vim-surround
    vim-textobj-user
    # youcompleteme
    vim-eunuch

    # themes
    iceberg-vim
    vim-colors-solarized
    vim-farout
    gruvbox 

    # haskell ide!
    coc-nvim
    haskell-vim
    vim-stylishask
    hlint-refactor-vim   
    vim-hoogle
  ];

  vim-haskellFold = vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-haskellFold";
    version = "1.0.0";
    src = fetchFromGitHub {
      owner = "sheepfleece";
      repo = "vim-haskellFold";
      rev = "42dbb64c79ee4c55ee87d2615c483b23e9a28cd1";
      sha256 = "0hdw0535d59zmfcg0ly9krkk7gyz20yy9013v20llnf748m28ada";
    };
    dependencies = [];
  };

  vim-ripgrep = vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-ripgrep";
    version = "1.0.0";
    src = fetchFromGitHub {
      owner = "jremmen";
      repo = "vim-ripgrep";
      rev = "ec87af6b69387abb3c4449ce8c4040d2d00d745e";
      sha256 = "1by56rflr0bmnjvcvaa9r228zyrmxwfkzkclxvdfscm7l7n7jnmh";
    };
    dependencies = [];
  };

  vim-farout = vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-farout";
    version = "1.0.0";
    src = fetchFromGitHub {
      owner = "fcpg";
      repo = "vim-farout";
      rev = "3975c275a01224db29247cb61a67111ec3729f12";
      sha256 = "1k3i5g9x1ygiz2lq6nzwp5dy43f13s298vf8hkkrrd8vs74c90qq";
    };
    dependencies = [];
  };

  gruvbox = vimUtils.buildVimPluginFrom2Nix {
    pname = "gruvbox";
    version = "1.0.0";
    src = fetchFromGitHub {
      owner = "morhetz";
      repo = "gruvbox";
      rev = "040138616bec342d5ea94d4db296f8ddca17007a";
      sha256 = "0qk2mqs04qlxkc1ldgjbiv1yisi2xl2b8svmjz0hdp9y2l5vfccw";
    };
    dependencies = [];
  };

  vim-hoogle = vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-hoogle";
    version = "1.0.0";
    src = fetchFromGitHub {
      owner = "Twinside";
      repo = "vim-hoogle";
      rev = "871d104c92e33cb238506f2805f1652561978cc8";
      sha256 = "17qvi57g72ijgk7nczczli3kcphvdf625fzqbqcmqpsawgvfd07n";
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
  environment.systemPackages = [
    nvim 
    xsel # X clipboard
  ];
}
