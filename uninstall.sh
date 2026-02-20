#!/system/bin/sh

# Restore SELinux sysfs permissions
chmod 644 /sys/fs/selinux/enforce

# Remove property override
if [ -x "$(command -v resetprop)" ]
then
	resetprop --delete ro.boot.selinux
fi
