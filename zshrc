if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -d "$HOME/.config/composer" ]; then
  export PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

export PATH=$HOME/bin:$PATH

export TERM=xterm-256color

# Allow cd to look in these directories
setopt auto_cd
cdpath=($HOME/code $HOME)

source <(antibody init)

# Use pure
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure

# Syntax highlighting bundle.
antibody bundle zsh-users/zsh-syntax-highlighting
