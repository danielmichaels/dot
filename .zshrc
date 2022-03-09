## Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="spaceship"
ZSH_THEME="agnoster"
#ZSH_THEME="avit" # termtosvg minimal theme

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
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH="$(go env GOPATH)/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH
export EDITOR=vim
export VISUAL=vim
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export GITUSER="danielmichaels"
export SCRIPTS="$HOME/.local/bin"
#######################################################
#                  GO Settings                      #
#######################################################
# Setup private repos by defining the user, in this case, me.
export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
#export GOPROXY="direct"
export GOPROXY=https://goproxy.io,direct
#######################################################
#                  Exports
#######################################################
export OPENFAAS_URL=https://faasd.ptco.rocks
#######################################################
#                  Android Exports                      #
#######################################################
#export ANDROID_SDK_ROOT=/home/nimitz/Android/platform-tools_r31.0.3-linux/platform-tools
#export ANDROID_AVD_HOME=/home/nimitz/Android/avds
#export ANDROID_EMULATOR_HOME=/home/nimitz/Android/Sdk/emulator
#
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
alias fzfp="fzf --preview='head -$LINES {}'"
alias TS="trizen -Syu"
alias inet="ip -br a"
alias wiki="vim $HOME/Code/github/databank/playbook/pages/index.md"
alias ls="exa"
alias el="exa --oneline"
alias ee="exa --header --long"
alias la="exa --header --long --git --all"
alias ssh="ssh -v"
alias nextdnsup="sudo nextdns install -config b29cfa -report-client-info && sudo nextdns activate"
alias nextdnsdown="sudo nextdns deactivate && sudo nextdns uninstall"
alias doc='docker-compose'
alias notes='code $HOME/Documents/notes/'
alias offdocker='docker run --rm -it --name my-offensive-docker aaaguirrep/offensive-docker /bin/zsh'
alias portainer='docker run -d -p 9001:9001 -p 9000:9000 --name=portainer --restart=always --pull=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce'
alias swagger="docker run --rm -it  --user $(id -u):$(id -g) -e GOPATH=$HOME/go:/go -v $HOME:$HOME -w $(pwd) quay.io/goswagger/swagger"
alias k="minikube kubectl --"
alias mk="minikube"
alias qb="flatpak run org.qutebrowser.qutebrowser "
#alias lynx="docker run -it --rm rwxrob/lynx "
alias chmox="chmod +x "
alias lg="lazygit"
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
startvmheadless() { VBoxManage startvm "$1" --type headless }
stopvm() { VBoxManage controlvm "$1" poweroff }
pw() {
  pwgen -sync "${1:-48}" -1
}
#
FTS() {
  echo -e "[*] Checking Flatpak for Updates [*]"
  flatpak update
  echo -e "[*] Running Pacman -Syu [*]"
  trizen -Syu
  echo -e "[!] Update Complete! [!]"
}
# cd and ls automatically
function cd {
  builtin cd "$@" && ls -F; 
}

mkdircd() {
  mkdir -p $1 && cd $_
}

poetryshell() {
  echo "Activating Poetry shell..."
  source "$( poetry env list --full-path | grep Activated | cut -d' ' -f1 )/bin/activate" 
}

changedetection() {
  echo -e "[!] getting latest `changedetection.io` docker image [!]"
  docker pull dgtlmoon/changedetection.io
  echo -e "[!] ..done - killing old containers... [!]"
  docker kill $(docker ps -a|grep changedetection.io|awk '{print $1}')
  docker rm $(docker ps -a|grep changedetection.io|awk '{print $1}')
  echo -e "[!] ..restarting the container with new image..."
  docker run -d --restart always -p "127.0.0.1:5500:5000" -v datastore-volume:/datastore --name changedetection.io dgtlmoon/changedetection.io
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
#                 VIRTUALENV                          #
#######################################################
#
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
#source /usr/bin/virtualenvwrapper.sh
source $HOME/.local/bin/virtualenvwrapper.sh  #work around --user install
export WORKON_HOME=$HOME/.virtualenvs
alias mkvirtualenv="mkvirtualenv --python=/usr/bin/python3.10" # manually change for py2

#source /usr/share/nvm/init-nvm.sh
#

eval $(thefuck --alias)
eval "$(starship init zsh)"

#source /usr/share/nvm/init-nvm.sh
command -v gh >/dev/null 2>&1 && source <(gh completion --shell zsh) || echo "github-cli not installed, cannot source completions"
command -v faas-cli >/dev/null 2>&1 && source <(faas-cli completion --shell zsh)
export PATH="$HOME/.poetry/bin:$PATH"

command -v feh >/dev/null 2>&1 && feh-bg
