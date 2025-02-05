export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

HYPHEN_INSENSITIVE="true"


plugins=(git docker colored-man-pages fast-syntax-highlighting zsh-autosuggestions colorize macos gitignore kubectl golang autojump aws)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh


source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


change_bg() {
 thumbnails="/Users/`echo ${USER}`/workbench/bgimgs"
 images=(`ls $thumbnails`)
 num_images=${#images[*]}
 myfilename="${thumbnails}/`echo ${images[$((RANDOM%$num_images + 1))]}`"

 base64filename=`echo ""${myfilename}"" | base64`;
 tmux_pane=$TMUX_PANE

 echo $myfilename > tmux_pane
 base64filename=`echo ""${myfilename}"" | base64`;
 echo "Base64 data: $base64filename"
 echo "\033]1337;SetBackgroundImageFile=${base64filename}\a" > tmux_pane
 unset $RANDOMM
}

b64e() {
    echo -n "$1" | base64
}

b64d() {
    echo -n "$1" | base64 --decode
}

################
# Aliases
################
alias zshconfig="nvim ~/.zshrc"
alias tf="terraform"
alias docamd="docker build --platform linux/amd64 -t "
alias doc="docker"
alias docrun="docker run "

##################
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#################
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$PATH:/usr/local/go/bin"

# Grit
export GRIT_INSTALL="$HOME/.grit"

# PATH
export PATH="$GRIT_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
