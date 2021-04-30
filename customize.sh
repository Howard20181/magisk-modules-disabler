ui_print "- Magisk version: $MAGISK_VER_CODE"
if [ "$MAGISK_VER_CODE" -lt 21000 ]; then
    ui_print "*********************************************************"
    ui_print "! Please install Magisk v21+"
    abortC "*********************************************************"
fi
