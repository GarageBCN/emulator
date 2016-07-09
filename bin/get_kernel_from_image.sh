#!/bin/bash

RASPBIAN_DIR=${1-/home/vagrant/raspbian}
RASPBIAN_DOWNLOADED_IMAGE=${RASPBIAN_DIR}/????-??-??-raspbian-*.img
RASPBIAN_IMAGE=${RASPBIAN_DIR}/raspbian_latest.img

test -f ${RASPBIAN_IMAGE} || mv ${RASPBIAN_DOWNLOADED_IMAGE} ${RASPBIAN_IMAGE}

BOOT_OFFSET=$(($(sudo /sbin/fdisk -lu ${RASPBIAN_IMAGE} | grep W95 | tr -s ' ' | cut -d\  -f2) * 512))
ROOT_OFFSET=$(($(sudo /sbin/fdisk -lu ${RASPBIAN_IMAGE} | grep Linux | tr -s ' ' | cut -d\  -f2) * 512))

sudo mount -o loop,offset=${ROOT_OFFSET} ${RASPBIAN_IMAGE} /mnt
sudo mount -o loop,offset=${BOOT_OFFSET} ${RASPBIAN_IMAGE} /mnt/boot
cp /mnt/boot/kernel7.img ${RASPBIAN_DIR}
cp /mnt/boot/bcm2709-rpi-2-b.dtb ${RASPBIAN_DIR}
sudo sed -i -e 's/^[^#]/#/' /mnt/etc/ld.so.conf
sudo sed -i -e 's/^[^#]/#/' /mnt/etc/ld.so.preload
sudo umount /mnt/boot
sudo umount /mnt
