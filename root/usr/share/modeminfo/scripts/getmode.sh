#!/bin/sh

case $1 in
	2g|3g|4g)
		mmcli -J -m 0 | jsonfilter -e '@["modem"]["generic"]["supported-modes"][*]' | grep $1
	;;
esac

