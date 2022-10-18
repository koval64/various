#!/usr/bin

new_sink=$( pactl list sinks short | grep -v "RUNNING" | awk '{ print $1 }' )
sinks_count=$( pactl list sinks short | wc -l )

if [ "$sinks_count" == 2 ]; then
    notify-send "there are $sinks_count sinks ,  switching sink to $new_sink"
    pactl set-default-sink $new_sink
else
    notify-send "ERROR :  there are $sinks_count sinks ,  should be 2 ,  exitting..."
fi


