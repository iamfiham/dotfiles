#!/usr/bin/bash
dbus-monitor "interface='org.freedesktop.Notifications'" |
while read -r line; do
    echo "$line" | grep -q "method call.*Notify" && paplay /usr/share/sounds/freedesktop/stereo/bell.oga
done
