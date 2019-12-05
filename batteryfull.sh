#!/usr/bin/env bash
while true
do
    export DISPLAY=:0.0
    battery_percent=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    if on_ac_power; then
        if [ "$battery_percent" -gt 70 ]; then
            notify-send -i "$PWD/batteryfull.png" "Battery full." "Level: ${battery_percent}% "
            paplay /usr/share/sounds/ubuntu/ringtones/Alarm\ clock.ogg
        fi
    fi
    sleep 300 # (5 minutes)
done
