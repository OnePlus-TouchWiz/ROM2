#!/system/bin/sh
#if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:18015532:3f83298eb4059fb725c9835235c7da7141f4ae6e; then
#  applypatch EMMC:/dev/block/bootdevice/by-name/boot:15553832:6afa61f9e2b61fee71da17d43366e4d7b514c9ae EMMC:/dev/block/bootdevice/by-name/recovery 3f83298eb4059fb725c9835235c7da7141f4ae6e 18015532 6afa61f9e2b61fee71da17d43366e4d7b514c9ae:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
#else
#  log -t recovery "Recovery image already installed"
#fi
