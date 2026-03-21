#!/usr/bin/env bash

echo 'Starting waybar...'

pkill waybar
waybar &

echo 'waybar started.'
