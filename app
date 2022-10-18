#!/bin/bash

# if you wanna apply argument with space
# close it with 'arg with spaces' brackets

NOTIFICATIONS_ENABLED=false

GREEN="\e[32m"
ENDCOLOR="\e[0m"

show_notification()
{
	echo $1
	if $NOTIFICATIONS_ENABLED; then
		notify-send "$1" -t 2500
	fi
}

kill_application()
{
	show_notification "killing $1..."
	pkill -i $1
	sleep 1
	pkill -i $1
	if pgrep -i discord >/dev/null
	then
		show_notification "failed killing $1..."
	else
		show_notification "$1 killed..."
	fi
	ps aux | grep -i $1 | grep -v grep
}

show_application_options()
{
        echo -en "${GREEN}"
        echo -n "> $1 > 1)pids 2)pids with name x)kill q)quit"
        echo -e "${ENDCOLOR}"
}

if [ $# -ne 1 ]; then
    echo "application name please..."
else
    #
    # if application is running
    #
    if pgrep -i $1 >/dev/null	# ??? or -- if [ $(ps aux | grep -i $1 | wc -l) -gt 0 ]
    then
        #
        # loop forever - break by 'exit' command or 'ctrl-c' shortcut
        #
        while :
        do
            show_application_options $1
            read -s -n 1 ans;
            case $ans in
                1)  pgrep -i $1 -d " ";;
                2)  pgrep -ail $1;;
                x)  kill_application $1;;
                q)  exit;;
            esac
        done
    else
        echo "app $1 is not running..."
    fi
fi

