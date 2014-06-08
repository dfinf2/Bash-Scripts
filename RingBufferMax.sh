#!/bin/sh
ETHTOOL="/sbin/ethtool"
DEV="eth5"
RING="rx 4096 tx 4096"
RING_DEFAULT="rx 1024 tx 1024"
case "$1" in
start)
echo -n "Setting eth5 Ring Buffer Size to Max...";
$ETHTOOL -G $DEV $RING;
echo " done.";;
stop)
echo -n "Setting eth5 Ring Buffer Size to Default...")
$ETHTOOL -G $DEV $RING_DEFAULT;
echo " done."
;;
esac
exit 0