#!/bin/bash

notify-send "Screenshot taken" "$1" &
optipng $1
