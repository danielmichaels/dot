ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

HIST_STAMPS="dd.mm.yyyy"

plugins=(
  git
  tmux
  zsh-syntax-highlighting
  history
  z
  thefuck
  zsh-autosuggestions
  poetry
  colored-man-pages
  dotenv
)

source $ZSH/oh-my-zsh.sh

#######################################################
#                  Exports                            #
#######################################################
#
export GPG_TTY=$(tty)
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH="$(go env GOPATH)/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH
export EDITOR=vim
export VISUAL=vim
export PATH="$HOME/.poetry/bin:$PATH"
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export GITUSER="danielmichaels"
export REPOS="Code/github"
export SCRIPTS="$HOME/.local/bin/scripts"
export PATH=~/.local/bin/scripts:~/.local/bin:$PATH
export BLOG_DIRECTORY=$HOME/$REPOS/danielms/content/blog
export BLOG_PATH=$REPOS/danielms
#######################################################
#                  GO Settings                      #
#######################################################
# Setup private repos by defining the user, in this case, me.
export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
export GOBIN="$HOME/.local/bin"
export CGO_ENABLED=0
export GOPROXY=https://goproxy.io,direct
#######################################################
#                  Exports
#######################################################
export OPENFAAS_URL=https://faasd.ptco.rocks
#######################################################
#                  General Alias                      #
#######################################################
#
alias faas="faas-cli"
alias env="env-twitch"
alias zs="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias i3rc="vim ~/.config/i3/config"
alias i3statusrc="vim ~/.config/i3status-rust/config.toml"
alias vimrc="vim ~/.vimrc"
alias inet="ip -br a"
alias ls="exa"
alias el="exa --oneline"
alias ee="exa --header --long"
alias la="exa --header --long --git --all"
alias ssh="ssh -v"
alias doc='docker-compose'
alias portainer='docker run -d -p 9001:9001 -p 9000:9000 --name=portainer --restart=always --pull=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce'
alias swagger="docker run --rm -it  --user $(id -u):$(id -g) -e GOPATH=$HOME/go:/go -v $HOME:$HOME -w $(pwd) quay.io/goswagger/swagger"
alias k="minikube kubectl --"
alias mk="minikube"
alias chmox="chmod +x "
alias goids="go install github.com/danielmichaels/ds/cmd/ds@latest"
alias goizet="go install github.com/danielmichaels/zet-cmd/cmd/zet@latest"
#
#######################################################
#                  Git Alias                          #
#######################################################
#
alias gs="git status"
alias gf="git fetch"
alias gl="git log --graph --oneline --decorate --all"
alias gc="git commit"
alias gac="git add . && git commit" # drop into EDITOR to confirm 'git add .'
alias gp="git push -v"
alias blog="cd $HOME/Code/github/danielms && code ."
alias gitignore="gi linux,python,visualstudiocode,node,react,vuejs,python,rust,jetbrains,go"
alias checkout="git checkout"
#
######################################################
#                Custom Functions                    #
######################################################
#
gi() { curl -sLw n https://www.gitignore.io/api/$@ ;}
cheat() { curl -s "cheat.sh/$1"; }
startvm() { VBoxManage startvm "$1"}
#startvmheadless() { VBoxManage startvm "$1" --type headless }
stopvm() { VBoxManage controlvm "$1" poweroff }
#
# cd and ls automatically
function cd {
  builtin cd "$@" && ls -F; 
}
#######################################################
#                 VIM bindings                        #
#######################################################
#
set -o vi
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward
bindkey '^ ' autosuggest-accept
#
#######################################################
#                 VIRTUAL ENVIRONMENTS                #
#######################################################
#
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
#source /usr/bin/virtualenvwrapper.sh
source $HOME/.local/bin/virtualenvwrapper.sh  #work around --user install
export WORKON_HOME=$HOME/.virtualenvs
alias mkvirtualenv="mkvirtualenv --python=/usr/bin/python3.10" # manually change for py2

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#######################################################
#                 COMPLETIONS                         #
#######################################################
command -v gh >/dev/null 2>&1 && source <(gh completion --shell zsh) || echo "github-cli not installed, cannot source completions"
command -v faas-cli >/dev/null 2>&1 && source <(faas-cli completion --shell zsh)
command -v feh >/dev/null 2>&1 && feh-bg
complete -C ds ds
autoload -U compinit && compinit -i
#######################################################
#                 START UP                            #
#######################################################
eval $(thefuck --alias)
eval "$(starship init zsh)"

