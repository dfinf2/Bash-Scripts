#!/bin/sh
ETHTOOL="/sbin/ethtool"
DEV="eth5"
OPTIONS_OFF="rxhash off  txvlan off rxvlan off gro off gso off rx off tx off tso off"
OPTIONS_ON="rxhash on txvlan on rxvlan on gro on gso on rx on tx on tso on"
case "$1" in
start)
echo -n "Turning Off Unecessary Options for eth5...";
$ETHTOOL -K $DEV $OPTIONS_OFF;
echo " done.";;
stop)
echo -n "Turning Options Back to Default on eth5...";
$ETHTOOL -K $DEV $OPTIONS_ON
echo " done.";;
esac
exit 0