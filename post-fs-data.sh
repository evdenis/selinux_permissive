#!/system/bin/sh

# Avoid setenforce 0, which on Android 15+ causes FBE failures
# during post-fs-data (set_policy_failed: /data/media).
if [ -x "$(command -v magiskpolicy)" ] && magiskpolicy --live "permissive *"
then
	:
elif [ -x "$(command -v ksud)" ] && ksud sepolicy patch "permissive *"
then
	:
elif [ -x "$(command -v setenforce)" ]
then
	setenforce 0 || log -t selinux_permissive "setenforce failed"
	chmod 640 /sys/fs/selinux/enforce
else
	printf '0' > /sys/fs/selinux/enforce || log -t selinux_permissive "sysfs write failed"
	chmod 640 /sys/fs/selinux/enforce
fi

if [ -x "$(command -v resetprop)" ]
then
	resetprop -n ro.boot.selinux enforcing
	resetprop --delete ro.build.selinux 2>/dev/null
fi
