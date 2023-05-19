# Prompt
PROMPT_COMMAND=genPrompt

genPrompt() {
   local LastCommand="$?"
   local Default='\[\e[0m\]'
   local Red='\[\e[0;31m\]'
   local Green='\[\e[0;32m\]'
   local Yellow='\[\e[0;33m\]'
   local Blue='\[\e[0;34m\]'
   local Magenta='\[\e[0;35m\]'
   local Cyan='\[\e[0;36m\]'
   local White='\[\e[0;97m\]'

   if [ $LastCommand -ne "0" ]; then
      Status="${Yellow}!"
   else
      Status=""
   fi

   if [ $UID -eq 0 ]; then
      User="${Red}\u${Default}"
   else
      User="${Green}\u${Default}"
   fi

   PS1="${Status}${User}${White}@${Blue}\h ${Yellow}\w${Cyan} $(if type -t __git_ps1 > /dev/null; then __git_ps1 " (%s)"; fi) ${Magenta}$ ${Default}"
}

# Defaults
export EDITOR=vim
export TERM=xterm-256color

# Aliases
alias where='type -all'
alias ll="ls -lhA"

# Functions
mcd () {
    mkdir -p $1
    cd $1
}

function extract {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
        echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
        return 1
    else
        for n in $@
        do
            if [ -f "$n" ] ; then
                case "${n%,}" in
                    *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                    tar xvf "$n"       ;;
                    *.lzma)      unlzma ./"$n"      ;;
                    *.bz2)       bunzip2 ./"$n"     ;;
                    *.rar)       unrar x -ad ./"$n" ;;
                    *.gz)        gunzip ./"$n"      ;;
                    *.zip)       unzip ./"$n"       ;;
                    *.z)         uncompress ./"$n"  ;;
                    *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                    7z x ./"$n"        ;;
                    *.xz)        unxz ./"$n"        ;;
                    *.exe)       cabextract ./"$n"  ;;
                    *)
                        echo "extract: '$n' - unknown archive method"
                        return 1
                    ;;
                esac
            else
                echo "'$n' - file does not exist"
                return 1
            fi
        done
    fi
}

function killport() { kill $(lsof -t -i:$1); }

# Memes
if (which fortune &> /dev/null) && (which cowthink &> /dev/null); then
    fortune -n 300 | tr '\n' ' ' | cowthink -f tux
fi
