#!/bin/bash

notify-send "restarting pipewire" -t 2500
systemctl --user restart pipewire.service pipewire-pulse.service






