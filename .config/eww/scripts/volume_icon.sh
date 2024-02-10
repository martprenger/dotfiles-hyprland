#!/bin/sh

per="$(./scripts/getvol.sh)"

if [ "$per" -gt "90" ]; then
	icon="󰕾"
elif [ "$per" -gt "80" ]; then
	icon="󰕾"
elif [ "$per" -gt "70" ]; then
	icon="󰕾"
elif [ "$per" -gt "60" ]; then
	icon="󰖀"
elif [ "$per" -gt "50" ]; then
	icon="󰖀"
elif [ "$per" -gt "40" ]; then
	icon="󰖀"
elif [ "$per" -gt "30" ]; then
	icon="󰖀"
elif [ "$per" -gt "20" ]; then
	icon="󰕿"
elif [ "$per" -gt "10" ]; then
	icon="󰕿"
elif [ "$per" -gt "0" ]; then
	icon="󰕿"
else
        echo 󰕿 && exit
fi
echo "$icon"
exit
