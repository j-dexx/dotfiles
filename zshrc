export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export TERM=xterm-256color

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
