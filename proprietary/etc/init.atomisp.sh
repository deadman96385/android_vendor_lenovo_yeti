#!/system/bin/sh

# This script is started from init.rc on early-boot

# Load atomisp driver and dependencies in the proper order.  Note that
# we cannot do this from init.rc directly because atomisp wants to
# make a request_firmware call from its module init function, which
# init won't service until the module load completes!
modules=`getprop ro.boot.moduleslocation`
insmod $modules/videobuf-core.ko
insmod $modules/videobuf-vmalloc.ko
insmod $modules/ov8858_driver.ko
insmod $modules/ov2740_driver.ko
insmod $modules/atomisp-css2401a0_v21.ko dypool_enable=y repool_pgnr=32768
