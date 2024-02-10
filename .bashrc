
##-----------------------------------------------------
## synth-shell-prompt.sh
if [ -f /home/pyro/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/pyro/.config/synth-shell/synth-shell-prompt.sh
fi

# git auto complete
if [ -f /home/pyro/.bashScripts/gitAutoComplete.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/pyro/.bashScripts/gitAutoComplete.sh
fi
