#!/usr/bin/env bash

#
# Custom Script Runner
#

# Config
# UDIR="$HOME/.local/share/csr"
UDIR="csr-scripts"
THEME=${1:-$HOME/.config/rofi/solarized-black}

# Used defined options menu
OPTIONS=()
OPTIONS+=("discord")
OPTIONS+=("telegram")
OPTIONS+=("only first screen")
OPTIONS+=("only second screen")
OPTIONS+=("dual setup")
OPTIONS+=("duplicate first screen")
OPTIONS+=("duplicate second screen")
OPTIONS+=("toggle audio sinks")
OPTIONS+=("restart pipewire")
OPTIONS+=("clipdel")
# OPTIONS+=("lutris")
# OPTIONS+=("steam")
# OPTIONS+=("godot")
OPTIONS=$(IFS='|'; echo "${OPTIONS[*]}")  # convert into one string with IFS separator

# Action !!!
SELECTION=$(echo -e "${OPTIONS}" | rofi -sep "|" -dmenu -theme $THEME -p "my scripts")
case "${SELECTION}" in
	"clipdel")			bash 	"$UDIR/clipdel.sh"	;;
	"only first screen")		bash -c "bash $UDIR/dual_screen.sh first"	;;
	"only second screen")		bash -c "bash $UDIR/dual_screen.sh second"	;;
	"dual setup")			bash -c "bash $UDIR/dual_screen.sh extra"	;;
	"duplicate first screen")	bash -c "bash $UDIR/dual_screen.sh duplicate1"	;;
	"duplicate second screen")	bash -c "bash $UDIR/dual_screen.sh duplicate2"	;;
	"toggle audio sinks")		bash 	"$UDIR/togglesinks-pipewire.sh"	;;
	"restart pipewire")		bash 	"$UDIR/restartpipewire.sh"	;;
	"ledger")			ledger	;;
	"discord")			discord	;;
	"telegram")			telegram-desktop	;;
	"lutris")			lutris	;;
	"steam")			steam	;;
	"godot")			godot	;;
esac

