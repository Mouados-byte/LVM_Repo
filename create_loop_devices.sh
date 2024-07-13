#!/bin/bash

# Create loop devices for LVM testing
truncate -s 1G /tmp/disk1.img
truncate -s 1G /tmp/disk2.img

losetup /dev/loop18 /tmp/disk1.img
losetup /dev/loop19 /tmp/disk2.img

# Create a physical volume on loop devices
pvcreate /dev/loop18 /dev/loop19

# Create a volume group
vgcreate vg_test /dev/loop18 /dev/loop19

# Create logical volumes
lvcreate -L 500M -n lv_data vg_test
lvcreate -L 500M -n lv_backup vg_test

# Display created volumes
vgdisplay vg_test
lvdisplay /dev/vg_test/lv_data
lvdisplay /dev/vg_test/lv_backup

# Keep the container running
tail -f /dev/null