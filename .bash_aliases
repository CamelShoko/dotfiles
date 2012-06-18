 #-------------------
 #personnal Aliases
 #-------------------
 #alias man='man -M /usr/share/man'
 
 alias cls='clear'
 alias rm='rm -i'
 alias cp='cp -i'
 alias mv='mv -i'
 # -> Prevents accidentally clobbering files.
 alias mkdir='mkdir -p'
 
 alias h='history'
 alias j='jobs -l'
 alias which='type -a'
 alias ..='cd ..'
 alias path='echo -e ${PATH//:/\\n}'
 alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
 alias print='/usr/bin/lp -o nobanner -d $LPDEST'
 # Assumes LPDEST is defined (default printer)
 alias pjet='enscript -h -G -fCourier9 -d $LPDEST'
 # Pretty-print using enscript
 
 alias du='du -kh'       # Makes a more readable output.
 alias df='df -kTh'
 
 #-------------------------------------------------------------
 # The 'ls' family (this assumes you use a recent GNU ls)
 #-------------------------------------------------------------
 alias ll="ls -l --group-directories-first"
 alias ls='ls -hF --color'  # add colors for filetype recognition
 alias la='ls -Al'          # show hidden files
 alias lx='ls -lXB'         # sort by extension
 alias lk='ls -lSr'         # sort by size, biggest last
 alias lc='ls -ltcr'        # sort by and show change time, most recent last
 alias lu='ls -ltur'        # sort by and show access time, most recent last
 alias lt='ls -ltr'         # sort by date, most recent last
 alias lm='ls -al |more'    # pipe through 'more'
 alias lr='ls -lR'          # recursive ls
 alias tree='tree -Csu'     # nice alternative to 'recursive ls'


# Tmux don't detect utf-8 successful, so force it
alias tmux='tmux -u'
alias scr=screen
