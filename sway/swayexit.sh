#!/bin/sh
# /usr/bin/swayexit

# with openrc use loginctl
[ "$(cat /proc/1/comm)" = "systemd" ] && logind=systemctl || logind=loginctl

case "$1" in
    lock)
        swaylock -c 000000
        ;;
    logout)
        swaymsg exit
        ;;
    switch_user)
        dm-tool switch-to-greeter
        ;;
    suspend)
        blurlock && $logind suspend
        ;;
    hibernate)
        blurlock && $logind hibernate
        ;;
    reboot)
        $logind reboot
        ;;
    shutdown)
        $logind poweroff
        ;;
    *)
        echo "== ! swayexit: missing or invalid argument ! =="
        echo "Try again with: lock | logout | switch_user | suspend | hibernate | reboot | shutdown"
        exit 2
esac

exit 0
