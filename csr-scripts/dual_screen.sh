#!/usr/bin/bash

NOTIFICATIONS_ENABLED=false
first="DVI-D-0"
second="HDMI-A-0"
smode="--output $second --mode 1360x768"
pmode="--output $first --mode 1920x1080"

restore_wallpaper()
{
      nitrogen --restore &
}

show_notification()
{
	if $NOTIFICATIONS_ENABLED; then
		notify-send "$1" -t 2500
	fi
}

only_first_screen () {
    xrandr --output "$second" --off --output "$first" --mode 1920x1080
}

only_second_screen () {
    xrandr --output "$first" --off --output "$second" --mode 1360x768
}

extra_screen () {
    xrandr --output "$second" --mode 1360x768 --output "$first" --mode 1920x1080 --primary --right-of "$second"
}

duplicate_first_screen () {
    xrandr --output "$second" --mode 1360x768 --output "$first" --mode 1920x1080 --primary --same-as "$second"
}

duplicate_second_screen () {
    xrandr --output "$first" --mode 1280x720 --output "$second" --mode 1280x720 --primary --same-as "$first"
}

check_status_first_screen () {
  xrandr | grep -q "$first connected [0-9]"
}

check_status_second_screen () {
  xrandr | grep -q "$second connected primary [0-9]"
}

print_screens_status () {
  check_status_first_screen
  if [ "$?" -eq 1 ]; then
    echo "[ $first screen is off ]"
  else
    echo "[ $first screen is on ]"
  fi
  check_status_second_screen
  if [ "$?" -eq 1 ]; then
    echo "[ $second screen is off ]"
  else
    echo "[ $second screen is on ]"
  fi
}

choose_what_to_do () {
  IFS=''
  print_screens_status
  echo
  echo "1) only first screen"
  echo "2) only second screen"
  echo "3) dual mode"
  echo "4) duplicate first screen"
  echo "5) duplicate second screen"
  echo
  echo -n "(1/2/3/4/5) :  "
  read -s -N 1 choice
  if [ "$choice" == "1" ]; then
    only_first_screen
  elif [ "$choice" == "2" ]; then
    only_second_screen
  elif [ "$choice" == "3" ]; then
    extra_screen
  elif [ "$choice" == "4" ]; then
    duplicate_first_screen
  elif [ "$choice" == "5" ]; then
    duplicate_second_screen
  else
    echo -n "exitting..."
  fi
  echo
}

case "$1" in
    "first")
      show_notification "only first screen..."
      only_first_screen
      restore_wallpaper
      ;;
    "second")
      show_notification "only second screen..."
      only_second_screen
      restore_wallpaper
      ;;
    "extra")
      show_notification "dual screen setup..."
      extra_screen
      restore_wallpaper
      ;;
    "duplicate1")
      show_notification "duplicating first screen..."
      duplicate_first_screen
      restore_wallpaper
      ;;
    "duplicate2")
      show_notification "duplicating second screen..."
      duplicate_second_screen
      restore_wallpaper
      ;;
    *)
      choose_what_to_do
      restore_wallpaper
esac


