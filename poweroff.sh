#!/usr/bin/env bash
# lock|logout|sleep|hibernate|reboot|shutdown
options="lock|logout|reboot|shutdown"
theme=${1:-$HOME/.config/rofi/poweroff.rasi}
selection=$(echo -e "${options}" | rofi -sep "|" -dmenu -theme $theme)
case "${selection}" in
  "lock")
    notify-send "poweroff.sh" "lock" -t 1500
    slock
    ;;
  "logout")
    notify-send "poweroff.sh" "logout" -t 1500
    pkill dwm
    ;;
  "sleep")
    notify-send "poweroff.sh" "suspending" -t 1500
    systemctl suspend
    ;;
  "reboot")
    notify-send "poweroff.sh" "reboot" -t 1500
    systemctl reboot
    ;;
  "shutdown")
    notify-send "poweroff.sh" "shutdown" -t 1500
    systemctl poweroff
    ;;
esac

