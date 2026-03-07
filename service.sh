#!/system/bin/sh

# Schedule task

nohup sh > /dev/null 2>&1 <<EOF &

wait_boot_complete()
{
	until [ "x\$(getprop sys.boot_completed)" = "x1" ]
	do
		sleep 5
	done
}

wait_boot_complete

if [ -x "\$(command -v setenforce)" ]
then
	setenforce 0
else
	printf '0' > /sys/fs/selinux/enforce
fi

if [ "\$(getenforce)" != "Permissive" ]
then
	log -t selinux_permissive "Failed to set SELinux to permissive. Kernel may enforce always-enforcing mode."
fi

# Hide permissive state from non-root processes
chmod 640 /sys/fs/selinux/enforce

if [ -x "\$(command -v resetprop)" ]
then
	resetprop -n ro.boot.selinux enforcing
fi

# Delete legacy property (removed in Android 8, but present on older devices)
if [ -x "\$(command -v resetprop)" ] && [ -n "\$(resetprop ro.build.selinux)" ]
then
	resetprop --delete ro.build.selinux
fi

EOF
