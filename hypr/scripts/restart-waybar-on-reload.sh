#!/usr/bin/env bash

SOCK="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

restart_waybar() {
  pkill -x waybar
  nohup waybar >/dev/null 2>&1 &
}

reload_waybar() {
  pkill -SIGUSR2 -x waybar
}

socat -U - UNIX-CONNECT:"$SOCK" | while IFS= read -r line; do
  case "$line" in
    configreloaded*)
      restart_waybar
      ;;
  esac
done
