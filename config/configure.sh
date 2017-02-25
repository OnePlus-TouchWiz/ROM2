#!/sbin/sh

SLOT=$(for i in "$(cat /proc/cmdline)"; do echo "$i" | grep slot | dd bs=1 skip=24 2>/dev/null; done)
if [ $(grep "boot_a" /etc/recovery.fstab 2>/dev/null) != "" ]; then
    SLOT="_a"
fi
echo "slotnum=$SLOT" > /tmp/config

BYNAME="$(find /dev -name by-name 2>/dev/null | grep -m 1 "")"
if [ "$BYNAME" = "" ]; then
    for i in /etc/twrp.fstab /etc/fstab.* /etc/*.fstab; do
        if [ -f "$i" ]; then
            BYNAME=$(cat "$i" 2>/dev/null | grep by-name | grep system)
            if [ -e "$BYNAME" ]; then
                break
            fi
        fi
    done
    if [ -e "$BYNAME" ]; then
        byname=""
        for i in $(echo "$BYNAME" | tr -s ' ' | cut -d' ' -f1-); do
            if [ $(echo "$i" | grep by-name) != "" ]; then
                byname=$(echo "$i" | rev | cut -d'/' -f2- | rev)
                break
            fi
        done
    fi
else
    byname="$BYNAME"
fi
echo "byname=$byname" >> /tmp/config
