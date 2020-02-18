# SELinux Permissive

This module switches SELinux to permissive mode during boot process.

This module intentionally lowers security settings of your
phone. Please, don't use it if you don't know what you are doing.

The module will not work if your kernel compiled with always enforcing config,
e.g., stock samsung kernels.

## How to install:

Stable release:
1. Dowload latest selinux_permissive.zip from releases page
   https://github.com/evdenis/selinux_permissive/releases
2. MagiskManager -> Modules + Downloads/selinux_permissive.zip -> Reboot

Master branch:
1. git clone https://github.com/evdenis/selinux_permissive
2. cd selinux_permissive
3. git archive --output selinux_permissive.zip HEAD
4. adb push selinux_permissive.zip /sdcard/
5. MagiskManager -> Modules + selinux_permissive.zip -> Reboot

## Support

- [Telegram](https://t.me/joinchat/GsJfBBaxozXvVkSJhm0IOQ)
- [XDA Thread](https://forum.xda-developers.com/apps/magisk/module-debugging-modules-adb-root-t4050041)
