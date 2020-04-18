{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; 
    [ 
      (vim_configurable.customize { 
        name = "vim";
        vimrcConfig.customRC = ''
          source $HOME/.vimrc
        '';

        vimrcConfig.packages.myVimPackage = with vimPlugins; { 
          start = [ 
            ReplaceWithRegister
            vim-commentary
            vim-repeat
            vim-sort-motion
            vim-surround
            vim-textobj-user
            # vim-stylish-haskell
            vim-stylishask
            fzfWrapper fzf-vim nerdtree 

            vim-fugitive
            solarized
          ];
        };
      })

    ];
}