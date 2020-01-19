#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch an instance of polybar per-monitor
for m in $(polybar --list-monitors | cut -d":" -f1); do
  MONITOR=$m polybar -r -c ~/.config/polybar/config.ini main &
done