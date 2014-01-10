#!/system/bin/sh

#/sbin/setpropex ro.warranty_bit 0
#/sbin/setpropex ro.emmc_checksum 0

CMDLINE_FILE_JB_MR1=/data/media/0/kbc/cmdline
if [ -f $CMDLINE_FILE_JB_MR1 ]; then
    FELICA_CMDLINE=`cat $CMDLINE_FILE_JB_MR1`
    echo "$FELICA_CMDLINE" > /proc/cmdline
    exit 0
fi

FELICA_KEY_FILE_JB_MR1=/data/media/0/TweakS3A/felica_key
if [ -f $FELICA_KEY_FILE_JB_MR1 ]; then
    FELICA_KEY=`cat $FELICA_KEY_FILE_JB_MR1`
    BASE_CMDLINE=`cat /proc/cmdline`
    echo "cordon=$FELICA_KEY $BASE_CMDLINE" > /proc/cmdline
fi

