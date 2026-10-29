{ config, ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      l = "ls -p --colour=auto";
      ls = "ls -p --color=auto";
      la = "ls -ap --color=auto";
      mkdirenv = "echo \"use flake\" >> .envrc && direnv allow";
      r = "ranger";
      snerp = "sudo nixos-rebuild switch"; # used to be snrs, but I just started saying 'snerp' in my head and so here we are. meep merp :3 xD
      v = "vim";
      woman = "man"; # level 3 woke
      zed = "zeditor";
    };

    initContent = ''
      # %1~ shows name of the current working directory, or ~ if that's the user's home directory, :3 is a cute kitty cat
      PROMPT='%1~ :3 '

      # add my scripts (found in home/bin/scripts) to the PATH, the variable that tells programs where to look when you want to run a program.
      # sorry if 2 much detail im just trying to explain everything
      export PATH=$PATH:$HOME/bin/
      export PATH=$PATH:$HOME/bin/vanta1

      # make direnv watch the working directory to see automatically load dev shells
      eval "$(direnv hook zsh)"

      ## Keybinds

      # Ctrl+[Left/Right] arrow for navigating word
      bindkey ";5C" forward-word
      bindkey ";5D" backward-word

      # Alt+[Left/Right] arrow for navigating to start/end of line
      bindkey ";3C" end-of-line
      bindkey ";3D" beginning-of-line
    '';

    # don't need .zshrc cluttering up the home directory
    dotDir = "${config.xdg.configHome}/zsh";
  };
}
