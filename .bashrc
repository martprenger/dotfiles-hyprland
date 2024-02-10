
##-----------------------------------------------------
## synth-shell-prompt.sh
if [ -f /home/pyro/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/pyro/.config/synth-shell/synth-shell-prompt.sh
fi

# git auto complete
if [ -f /home/pyro/.bashScripts/gitAutoComplete.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/pyro/.bashScripts/gitAutoComplete.sh
fi

##-----------------------------------------------------
## synth-shell-greeter.sh
if [ -f /home/pyro/.config/synth-shell/synth-shell-greeter.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/pyro/.config/synth-shell/synth-shell-greeter.sh
fi

##-----------------------------------------------------
## better-ls
if [ -f /home/pyro/.config/synth-shell/better-ls.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/pyro/.config/synth-shell/better-ls.sh
fi

##-----------------------------------------------------
## alias
if [ -f /home/pyro/.config/synth-shell/alias.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/pyro/.config/synth-shell/alias.sh
fi

##-----------------------------------------------------
## better-history
if [ -f /home/pyro/.config/synth-shell/better-history.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/pyro/.config/synth-shell/better-history.sh
fi
