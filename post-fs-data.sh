#!/system/bin/sh

if [ -x "$(command -v setenforce)" ]
then
	setenforce 0
else
	echo -n 0 > /sys/fs/selinux/enforce
fi

if [ "$(getenforce)" != "Permissive" ]
then
	log -t selinux_permissive "Failed to set SELinux to permissive. Kernel may enforce always-enforcing mode."
fi
