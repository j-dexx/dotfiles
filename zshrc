if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

export PATH=$HOME/bin:$PATH

export TERM=xterm-256color

# Allow cd to look in these directories
setopt auto_cd
cdpath=($HOME/code/work $HOME/code $HOME)

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
