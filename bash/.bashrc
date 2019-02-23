# Prompt
PROMPT_COMMAND=genPrompt

genPrompt() {
   local LastCommand="$?"
   local Default='\[\e[0m\]'
   local Red='\[\e[0;31m\]'
   local Yellow='\[\e[0;33m\]'
   local Blue='\[\e[38;5;26m\]'
   local White='\[\e[1;37m\]'
   local Green='\[\e[38;5;118m\]'
   local Orange='\[\e[38;5;208m\]'

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
   PS1="${Status}${User}${White}@${Blue}\h ${Orange}\w${Green} $(__git_ps1 " (%s)") ${Blue}$ ${Default}"
}

# Defaults
export EDITOR=vim

# Aliases
alias where='type -all'

# Memes
if (which fortune &> /dev/null) && (which cowthink &> /dev/null); then
    fortune -n 300 | tr '\n' ' ' | cowthink -f tux
fi
