# often used currently
alias tasks="cd $HOME/lambda-cases/other/; vim current_tasks.txt"

# configs
bashFile="$HOME/.bashrc"
alias vb="vim $bashFile"
alias sb="source $bashFile"
alias vba="vim $HOME/.bash_aliases"
alias vv="vim $HOME/.vimrc"

# git
alias gp="git pull"
alias gc="git clone"
alias gb="git branch"
alias gch="git checkout"
alias gd="git diff"
alias gl="git log"

# general commands in short
alias m="make"
alias mc="make clean"
alias mc_="make clean_"
alias ..="cd .."
alias gr="grep -rn"

# haskell 
alias cb="cabal build"
alias cr="cabal run"
alias ghci="ghci -XLambdaCase"

# docker
alias dps="docker ps"
alias dims="docker images"
alias drmi="docker image rm -f"
alias db="docker build . -t"
alias dr="docker run"
alias dk="docker kill"
alias dcb="docker-compose build"
alias dcu="docker-compose up"
alias dck="docker-compose kill"

# stay in same dir after ranger exit
alias r="ranger --choosedir=$HOME/.rangerdir; cd \"\`cat $HOME/.rangerdir\`\""

# help scripts
helpScripts="$HOME/StunningFiles/Scripts"
alias temp="$helpScripts/CopyTemplate.sh"
alias dirr="$helpScripts/ReplaceInDir.sh"
alias inv="$helpScripts/InVim.sh"

# grades
alias grades="cd $HOME/StunningExecutables/Grades; stack run"
