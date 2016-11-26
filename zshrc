if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -d "$HOME/.config/composer" ]; then
  export PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

if [ -d "$HOME/Homestead" ]; then
  function homestead() {
    ( cd ~/Homestead && vagrant $* )
  }
fi

export PATH=$HOME/.config/composer/vendor/bin:$HOME/bin:$PATH

export TERM=xterm-256color

# Allow cd to look in these directories
setopt auto_cd
cdpath=($HOME/code $HOME)

# If antigen exists, load it
if [ -f ~/antigen/antigen.zsh ]; then
  source ~/antigen/antigen.zsh

  # Use pure 
  antigen bundle mafredri/zsh-async
  antigen bundle sindresorhus/pure

  # Syntax highlighting bundle.
  antigen bundle zsh-users/zsh-syntax-highlighting

  antigen apply
fi
