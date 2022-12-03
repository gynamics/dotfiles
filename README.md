# dotfiles
Some personal user configuration files

- `.Xresources`
  this includes xterm configurations
- `.Xdefaults`
  this includes urxvt configurations, however, perl scripts seems to have been deprecated
- `.zshrc`
  to use it you need to make some configurations:
  - if you want to display host ip & login ip information in `RPROMPT`
    make sure you have `coreutils` and `ineutils` installed.
    otherwise, just remove the RPROMPT variable
  - modify `http_proxy` to yours own proxy, if you have one
  - install zsh plugins (you can find them in arch community library)
    - `zsh-autosuggestions`
    - `zsh-syntax-highlighting`
    or just remove the last two lines
  - about zsh scripts
    - `gitneko.zsh` can be found in `gynamics/zsh-gitneko`
    - `dirstack.zsh` can be found in `gynamics/zsh-dirstack`
- `.vimrc`
  install `vim-plug` to install plugins
  
If you have any other questions, ask me for free!
