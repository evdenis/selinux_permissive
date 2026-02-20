# SELinux Permissive

This module switches SELinux to permissive mode during boot process.

This module intentionally lowers security settings of your
phone. Please, don't use it if you don't know what you are doing.

The module will not work if your kernel compiled with always enforcing config,
e.g., stock samsung kernels.

## Features

- Sets SELinux to permissive mode at both post-fs-data and service stages
- Hides permissive state from non-root apps:
  - Restricts read access to `/sys/fs/selinux/enforce`
  - Masks `ro.boot.selinux` property via resetprop
- Supports Magisk Manager auto-update
- Clean removal via uninstall.sh (restores sysfs permissions and property)

## How to install:

Stable release:
1. Download latest selinux_permissive.zip from releases page
   https://github.com/evdenis/selinux_permissive/releases
2. MagiskManager -> Modules + Downloads/selinux_permissive.zip -> Reboot

Master branch:
1. git clone https://github.com/evdenis/selinux_permissive
2. cd selinux_permissive
3. make install

## Support

- [Telegram](https://t.me/joinchat/GsJfBBaxozXvVkSJhm0IOQ)
- [XDA Thread](https://forum.xda-developers.com/apps/magisk/module-debugging-modules-adb-root-t4050041)
