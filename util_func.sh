MODSPATH="/data/adb/modules"
MODS=$(ls "$MODSPATH")

disable_all_modules() {
    if [ -f /data/unencrypted/disable_all_modules ] || [ -f /cache/disable_all_modules ]; then
        for dir in $MODS; do
            if [ -d "$MODSPATH/$dir" ] && [ "$dir" != "hwr_magisk_modules_disabler" ]; then
                touch "$MODSPATH/$dir"/disable
            fi
        done
    fi
}

disable_modules_in_list() {
    if [ -f /data/unencrypted/disable.list ]; then
        DISABLE_LIST=/data/unencrypted/disable.list
    elif [ -f /cache/disable.list ]; then
        DISABLE_LIST=/cache/disable.list
    else
        DISABLE_LIST=""
    fi
    if [ "$DISABLE_LIST" != "" ]; then
        while IFS= read -r line; do
            if [ -d "$MODSPATH/$line" ] && [ "$line" != "hwr_magisk_modules_disabler" ]; then
                touch "$MODSPATH/$line/disable"
            fi
        done <"$DISABLE_LIST"
    fi
}

check_boot_success() {
    while [ "$(getprop sys.boot_completed)" != "1" ]; do
        sleep 3
    done
    while [ ! -d "/storage/emulated/0/Android" ]; do
        sleep 3
    done
    test_file="/storage/emulated/0/Download/.PERMISSION_TEST"
    touch "$test_file"
    while [ ! -f "$test_file" ]; do
        touch "$test_file"
        sleep 3
    done
    rm "$test_file"
}
