#!/system/bin/sh
MODDIR=${0%/*}
. ${MODDIR}/util_func.sh
check_boot_success

#touch ${MODDIR}/disable
#More magic is on the way!
[ -f /data/unencrypted/disable_all_modules ] && rm /data/unencrypted/disable_all_modules
[ -f /cache/disable_all_modules ] && rm /cache/disable_all_modules
