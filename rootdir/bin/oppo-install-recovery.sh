#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:83886080:93514505c665cb6fe9ae8792a40b922d410f0b58; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:b6f66a771eaa4fee0bb9ae7ad59d549a9904f8bd \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:83886080:93514505c665cb6fe9ae8792a40b922d410f0b58 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
