#!/bin/bash

is_muted=$(pacmd list-sinks | grep -A 15 '* index' | awk '/muted:/{ print $2 }')

if [ "$is_muted" == "yes" ]; then
    echo "muted"
else
    volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)
    echo $volume
fi

